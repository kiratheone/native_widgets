part of native_widgets;

class NativeTextInput extends StatelessWidget {
  final Widget leading, trailing;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction keyboardAction;
  final bool autoFocus, autoCorrect, obscureText, enabled, maxLengthEnforced;
  final FocusNode focusNode;
  final TextAlign textAlign;
  final int maxLength, maxLines;
  final ValueChanged<String> onChanged, onSubmitted;
  final VoidCallback onEditingComplete;
  final TextCapitalization textCapitalization;
  final InputDecoration decoration;

  NativeTextInput({
    this.leading,
    this.trailing,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.keyboardAction = TextInputAction.done,
    this.autoCorrect = true,
    this.autoFocus = false,
    this.obscureText = false,
    this.enabled = true,
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.maxLength,
    this.maxLines = 1,
    this.maxLengthEnforced = true,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.textCapitalization,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      cupertino: (BuildContext context, _ ) {
        return CupertinoTextField(
          controller: controller,
          placeholder: decoration?.labelText ?? "",
          prefix: leading,
          suffix: trailing,
          clearButtonMode: OverlayVisibilityMode.editing,
          textInputAction: keyboardAction,
          keyboardType: keyboardType,
          autocorrect: autoCorrect,
          autofocus: autoFocus,
          textCapitalization: textCapitalization,
          obscureText: obscureText,
          enabled: enabled,
          focusNode: focusNode,
          textAlign: textAlign,
          maxLength: maxLength,
          maxLines: maxLines,
          maxLengthEnforced: maxLengthEnforced,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          onEditingComplete: onEditingComplete,
        );
      },
      material: (BuildContext context, _ ) {
        return ListTile(
          leading: leading,
          trailing: trailing,
          title: TextField(
            decoration: decoration,
            textCapitalization: textCapitalization,
            controller: controller,
            textInputAction: keyboardAction,
            keyboardType: keyboardType,
            autocorrect: autoCorrect,
            autofocus: autoFocus,
            obscureText: obscureText,
            enabled: enabled,
            focusNode: focusNode,
            textAlign: textAlign,
            maxLength: maxLength,
            maxLines: maxLines,
            maxLengthEnforced: maxLengthEnforced,
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            onEditingComplete: onEditingComplete,
          ),
        );
      },
    );
  }
}
