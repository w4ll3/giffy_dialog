import 'package:flutter/material.dart';

class AssetGiffyDialog extends StatelessWidget {
  final String imagePath;
  final Text title;
  final Text description;
  final Text buttonOkText;
  final Text buttonCancelText;
  final Color buttonOkColor;
  final Color buttonCancelColor;
  final double buttonRadius;
  final double cornerRadius;
  final VoidCallback onOkButtonPressed;

  AssetGiffyDialog({
    Key key,
    @required this.imagePath,
    @required this.title,
    @required this.onOkButtonPressed,
    this.description,
    this.buttonOkText,
    this.buttonCancelText,
    this.buttonOkColor,
    this.buttonCancelColor,
    this.cornerRadius = 8.0,
    this.buttonRadius = 8.0,
  })  : assert(imagePath != null),
        assert(title != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cornerRadius)),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: (MediaQuery.of(context).size.height / 2) * 0.6,
                  child: Card(
                    elevation: 0.0,
                    margin: EdgeInsets.all(0.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(cornerRadius),
                            topLeft: Radius.circular(cornerRadius))),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: title,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: description,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    color: buttonCancelColor ?? Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(buttonRadius)),
                    onPressed: () => Navigator.of(context).pop(),
                    child: buttonCancelText ??
                        Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                  ),
                  RaisedButton(
                    color: buttonOkColor ?? Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(buttonRadius)),
                    onPressed: onOkButtonPressed ?? () {},
                    child: buttonOkText ??
                        Text(
                          'OK',
                          style: TextStyle(color: Colors.white),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
