@implementation CloudQuotaNotificationItemListManager

- (void)cloudQuotaControllerHelper:(id)a3 informationViewDidChange:(id)a4
{
  id v6;
  _TtC12PhotosUICore37CloudQuotaNotificationItemListManager *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  sub_1A6C7F420();

}

- (id)presentingViewControllerForCloudQuotaControllerHelper:(id)a3
{
  uint64_t (*v4)(void);
  id v5;
  _TtC12PhotosUICore37CloudQuotaNotificationItemListManager *v6;
  uint64_t v7;
  void *v8;
  id result;

  v4 = *(uint64_t (**)(void))(**(_QWORD **)((char *)&self->super.isa
                                         + OBJC_IVAR____TtC12PhotosUICore37CloudQuotaNotificationItemListManager_presentationContext)
                           + 88);
  v5 = a3;
  v6 = self;
  v7 = v4();
  if (v7)
  {
    v8 = (void *)v7;

    return v8;
  }
  else
  {
    result = (id)sub_1A7AE4AFC();
    __break(1u);
  }
  return result;
}

- (_TtC12PhotosUICore37CloudQuotaNotificationItemListManager)init
{
  _TtC12PhotosUICore37CloudQuotaNotificationItemListManager *result;

  result = (_TtC12PhotosUICore37CloudQuotaNotificationItemListManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore37CloudQuotaNotificationItemListManager_helper));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore37CloudQuotaNotificationItemListManager_statusProvider));
  swift_unknownObjectRelease();
  sub_1A6C80428((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore37CloudQuotaNotificationItemListManager__itemList);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore37CloudQuotaNotificationItemListManager_observable));
  v3 = (char *)self + OBJC_IVAR____TtC12PhotosUICore37CloudQuotaNotificationItemListManager___observationRegistrar;
  v4 = sub_1A7ADCCE4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
