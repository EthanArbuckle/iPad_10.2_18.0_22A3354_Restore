@implementation TTMutableParagraphStyle

+ (id)paragraphStyleNamed:(unsigned int)a3
{
  uint64_t v3;
  TTMutableParagraphStyle *v4;

  v3 = *(_QWORD *)&a3;
  v4 = objc_alloc_init(TTMutableParagraphStyle);
  -[TTParagraphStyle setStyle:](v4, "setStyle:", v3);
  return v4;
}

@end
