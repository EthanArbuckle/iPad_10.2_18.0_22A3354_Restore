@implementation TextAndImageButton

- (_TtC8StocksUI18TextAndImageButton)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI18TextAndImageButton *)sub_1DC182648(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI18TextAndImageButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DC182B90();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_class *ObjectType;
  id v7;
  _TtC8StocksUI18TextAndImageButton *v8;
  void *v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_1DC182B0C();
  sub_1DC182B48();
  sub_1DC408E54();
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_1DC408E48();
  v10.receiver = v8;
  v10.super_class = ObjectType;
  -[TextAndImageButton touchesBegan:withEvent:](&v10, sel_touchesBegan_withEvent_, v9, v7);

  objc_msgSend(*(id *)((char *)&v8->super.super.super.super.isa + OBJC_IVAR____TtC8StocksUI18TextAndImageButton_label), sel_setAlpha_, 0.5);
  objc_msgSend(*(id *)((char *)&v8->super.super.super.super.isa + OBJC_IVAR____TtC8StocksUI18TextAndImageButton_imageView), sel_setAlpha_, 0.5);

  swift_bridgeObjectRelease();
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_1DC1829A8(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesCancelled_withEvent_);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1DC1829A8(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesEnded_withEvent_);
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI18TextAndImageButton_imageView));

}

@end
