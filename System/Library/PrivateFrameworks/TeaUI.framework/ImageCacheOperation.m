@implementation ImageCacheOperation

- (void)main
{
  _TtC5TeaUIP33_2088E17F5F01413CA71FFC03BB03F42919ImageCacheOperation *v2;

  v2 = self;
  sub_1B1416798();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC5TeaUIP33_2088E17F5F01413CA71FFC03BB03F42919ImageCacheOperation_image));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC5TeaUIP33_2088E17F5F01413CA71FFC03BB03F42919ImageCacheOperation_error));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC5TeaUIP33_2088E17F5F01413CA71FFC03BB03F42919ImageCacheOperation_request);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC5TeaUIP33_2088E17F5F01413CA71FFC03BB03F42919ImageCacheOperation_downloader);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC5TeaUIP33_2088E17F5F01413CA71FFC03BB03F42919ImageCacheOperation_processor);
  swift_unknownObjectRelease();
  sub_1B13B9100(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC5TeaUIP33_2088E17F5F01413CA71FFC03BB03F42919ImageCacheOperation_imageCompletionBlock));
  swift_bridgeObjectRelease();
}

- (_TtC5TeaUIP33_2088E17F5F01413CA71FFC03BB03F42919ImageCacheOperation)init
{
  sub_1B14CF188();
}

@end
