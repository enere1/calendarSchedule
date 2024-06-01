import 'package:calender_schdule/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? initialValue;

  final bool isTime;
  final FormFieldSetter<String> onSaved;

  const CustomTextField(
      {required this.label, this.initialValue, required this.isTime, required this.onSaved, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label,
          style: TextStyle(color: PRIMARY_COLOR, fontWeight: FontWeight.w600)),
      if (isTime) RenderTextField() else Expanded(child: RenderTextField())
    ]);
  }

  Widget RenderTextField() {
    return TextFormField(
      onSaved: onSaved,
      // nullがリターンされたらエラーがなし
      // エラーがあったらStringにリターン
      validator: (String? val) {
        if (val == null || val.isEmpty) {
          return "入力してください。";
        }

        if (isTime) {
          int time = int.parse(val);

          if (time <= 0) {
            return "0以上を入力してください。";
          }

          if (time > 24) {
            return "24以下を入力してください。";
          }
        }

        return null;
      },
      initialValue: initialValue,
      cursorColor: Colors.grey,
      maxLines: isTime ? 1 : null,
      expands: isTime ? false : true,
      keyboardType: isTime ? TextInputType.number : TextInputType.multiline,
      inputFormatters: isTime ? [FilteringTextInputFormatter.digitsOnly] : [],
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey[300],
        suffixText: isTime ? '시' : null
      ),
    );
  }
}
