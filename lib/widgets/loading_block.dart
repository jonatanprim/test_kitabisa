import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingBlock extends StatefulWidget {

  final double? width;
  final double? height;
  final double? ml;
  final double? mr;
  final double? mt;
  final double? mb;

  const LoadingBlock({
    this.width,
    this.height,
    this.ml,
    this.mr,
    this.mt,
    this.mb,
    Key? key,
  }) : super(key: key);

  @override
  _LoadingBlockState createState() => _LoadingBlockState();
}

class _LoadingBlockState extends State<LoadingBlock> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: SizedBox(
          child: Container(
            margin: EdgeInsets.only(bottom: widget.mb ?? 0, top: widget.mt ?? 0, left:  widget.ml ?? 0 , right: widget.mr ?? 0),
            color: Colors.white,
            height: widget.height ?? 10,
            width: widget.width ?? 100,
          ),
        ),
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[200]!);
  }
}
