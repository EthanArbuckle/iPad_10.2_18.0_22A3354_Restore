@implementation ImageResourceAdaptor

- (void)dealloc
{
  void *v2;
  _TtC11BookStoreUIP33_5F65FBF02658678FCCE73175674AAD1F20ImageResourceAdaptor *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11BookStoreUIP33_5F65FBF02658678FCCE73175674AAD1F20ImageResourceAdaptor_resource);
  v3 = self;
  objc_msgSend(v2, "removeObserver:", v3);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for ImageResourceAdaptor();
  -[ImageResourceAdaptor dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC11BookStoreUIP33_5F65FBF02658678FCCE73175674AAD1F20ImageResourceAdaptor_resource));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11BookStoreUIP33_5F65FBF02658678FCCE73175674AAD1F20ImageResourceAdaptor_observers));
}

- (UIImage)image
{
  _TtC11BookStoreUIP33_5F65FBF02658678FCCE73175674AAD1F20ImageResourceAdaptor *v2;
  id v3;

  v2 = self;
  v3 = sub_14A020();

  return (UIImage *)v3;
}

- (id)load
{
  _TtC11BookStoreUIP33_5F65FBF02658678FCCE73175674AAD1F20ImageResourceAdaptor *v2;
  id v3;

  v2 = self;
  v3 = sub_14A0EC();

  return v3;
}

- (void)addInterest
{
  objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC11BookStoreUIP33_5F65FBF02658678FCCE73175674AAD1F20ImageResourceAdaptor_resource), "addInterest");
}

- (void)removeInterest
{
  objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC11BookStoreUIP33_5F65FBF02658678FCCE73175674AAD1F20ImageResourceAdaptor_resource), "removeInterest");
}

- (void)addNonVolatileInterest
{
  objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC11BookStoreUIP33_5F65FBF02658678FCCE73175674AAD1F20ImageResourceAdaptor_resource), "addNonVolatileInterest");
}

- (void)removeNonVolatileInterest
{
  objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC11BookStoreUIP33_5F65FBF02658678FCCE73175674AAD1F20ImageResourceAdaptor_resource), "removeNonVolatileInterest");
}

- (void)addWithObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC11BookStoreUIP33_5F65FBF02658678FCCE73175674AAD1F20ImageResourceAdaptor_observers), "addObject:", a3);
}

- (void)removeWithObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC11BookStoreUIP33_5F65FBF02658678FCCE73175674AAD1F20ImageResourceAdaptor_observers), "removeObject:", a3);
}

- (_TtC11BookStoreUIP33_5F65FBF02658678FCCE73175674AAD1F20ImageResourceAdaptor)init
{
  _TtC11BookStoreUIP33_5F65FBF02658678FCCE73175674AAD1F20ImageResourceAdaptor *result;

  result = (_TtC11BookStoreUIP33_5F65FBF02658678FCCE73175674AAD1F20ImageResourceAdaptor *)_swift_stdlib_reportUnimplementedInitializer("BookStoreUI.ImageResourceAdaptor", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)imageResourceDidChangeImage:(id)a3
{
  sub_14A2B8(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_imageResourceDidChangeImage_);
}

- (void)imageResourceDidChangeIntrinsicSize:(id)a3
{
  sub_14A2B8(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_imageResourceDidChangeIntrinsicSize_);
}

@end
