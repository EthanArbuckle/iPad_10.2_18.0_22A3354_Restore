@implementation INSearchForMediaIntentHandler

- (void)resolveMediaItemsForSearchForMedia:(id)a3 withCompletion:(id)a4
{
  void *v6;
  id v7;
  _TtC17SiriAudioInternal29INSearchForMediaIntentHandler *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_227247CE0(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)handleSearchForMedia:(id)a3 completion:(id)a4
{
  void (**v6)(void *, id);
  id v7;
  id v8;
  id v9;
  _TtC17SiriAudioInternal29INSearchForMediaIntentHandler *v10;

  v6 = (void (**)(void *, id))_Block_copy(a4);
  v7 = objc_allocWithZone(MEMORY[0x24BDDA070]);
  v8 = a3;
  v10 = self;
  v9 = objc_msgSend(v7, sel_initWithCode_userActivity_, 4, 0);
  v6[2](v6, v9);

  _Block_release(v6);
}

- (_TtC17SiriAudioInternal29INSearchForMediaIntentHandler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for INSearchForMediaIntentHandler();
  return -[INSearchForMediaIntentHandler init](&v3, sel_init);
}

@end
