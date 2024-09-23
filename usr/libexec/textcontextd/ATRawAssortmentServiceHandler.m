@implementation ATRawAssortmentServiceHandler

- (void)spotlightItemTitles:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t (*v6)();
  uint64_t v7;
  _TtC12textcontextd29ATRawAssortmentServiceHandler *v8;

  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_100008638, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1000043B4;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  _s12textcontextd29ATRawAssortmentServiceHandlerC19spotlightItemTitles_010completionE0ySi_ySSSgcSgtF_0(a3, (uint64_t)v6, v7);
  sub_1000041D8((uint64_t)v6, v7);

}

- (void)spotlightEmailAttributes:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t (*v6)();
  uint64_t v7;
  _TtC12textcontextd29ATRawAssortmentServiceHandler *v8;

  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_100008610, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1000043B4;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  _s12textcontextd29ATRawAssortmentServiceHandlerC24spotlightEmailAttributes_010completionE0ySi_ySSSgcSgtF_0(a3, (uint64_t)v6, v7);
  sub_1000041D8((uint64_t)v6, v7);

}

- (void)textOnScreenAX:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12textcontextd29ATRawAssortmentServiceHandler *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject(&unk_1000085E8, 24, 7);
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_10000420C;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  _s12textcontextd29ATRawAssortmentServiceHandlerC4text10onScreenAXyySSSgcSg_tF_0((uint64_t)v4, v5);
  sub_1000041D8((uint64_t)v4, v5);

}

- (_TtC12textcontextd29ATRawAssortmentServiceHandler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ATRawAssortmentServiceHandler();
  return -[ATRawAssortmentServiceHandler init](&v3, "init");
}

@end
