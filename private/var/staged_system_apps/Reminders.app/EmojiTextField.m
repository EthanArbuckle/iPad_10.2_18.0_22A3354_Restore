@implementation EmojiTextField

- (int64_t)_textInputSource
{
  return 1;
}

- (_TtC9RemindersP33_4FE8BD245B420E02FDB196B5E5563CD014EmojiTextField)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType(self, a2);
  return -[EmojiTextField initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC9RemindersP33_4FE8BD245B420E02FDB196B5E5563CD014EmojiTextField)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  return -[EmojiTextField initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
