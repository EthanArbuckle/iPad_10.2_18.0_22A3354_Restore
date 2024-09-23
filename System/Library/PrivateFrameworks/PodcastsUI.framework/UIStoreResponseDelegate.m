@implementation UIStoreResponseDelegate

- (_TtC10PodcastsUI23UIStoreResponseDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UIStoreResponseDelegate();
  return -[UIStoreResponseDelegate init](&v3, sel_init);
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _TtC10PodcastsUI23UIStoreResponseDelegate *v15;

  v10 = _Block_copy(a6);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = self;
  sub_1DA5293E8(v14, (uint64_t)sub_1DA529750, v11, (uint64_t)&unk_1EA0CAA60, (uint64_t)sub_1DA52980C, (uint64_t)&block_descriptor_19);

  swift_release();
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6
{
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _TtC10PodcastsUI23UIStoreResponseDelegate *v15;

  v10 = _Block_copy(a6);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = self;
  sub_1DA5293E8(v14, (uint64_t)sub_1DA529854, v11, (uint64_t)&unk_1EA0CA9E8, (uint64_t)sub_1DA52976C, (uint64_t)&block_descriptor_1);

  swift_release();
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _TtC10PodcastsUI23UIStoreResponseDelegate *v15;

  v10 = _Block_copy(a6);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = self;
  sub_1DA5293E8(v14, (uint64_t)sub_1DA529854, v11, (uint64_t)&unk_1EA0CAAD8, (uint64_t)sub_1DA529848, (uint64_t)&block_descriptor_28);

  swift_release();
}

@end
