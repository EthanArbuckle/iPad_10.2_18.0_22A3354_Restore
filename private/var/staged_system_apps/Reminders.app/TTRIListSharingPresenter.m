@implementation TTRIListSharingPresenter

- (void)requestCancelAddingSharees
{
  _QWORD *v3;
  void *Strong;
  id v5;
  id v6;

  if (*(_QWORD *)self->addShareesViewController)
  {
    v3 = sub_10001413C(self->router, *(_QWORD *)&self->router[24]);
    Strong = (void *)swift_unknownObjectWeakLoadStrong(*v3 + 16);
    swift_retain();
    if (Strong)
    {
      v5 = objc_msgSend(Strong, "popViewControllerAnimated:", 1);

    }
    v6 = *(id *)self->addShareesViewController;
    *(_QWORD *)self->addShareesViewController = 0;
    swift_release();

  }
}

- (void)requestCommitAddingSharees
{
  swift_retain();
  sub_1002F4DC8();
  swift_release();
}

@end
