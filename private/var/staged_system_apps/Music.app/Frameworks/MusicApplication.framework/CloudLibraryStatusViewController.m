@implementation CloudLibraryStatusViewController

- (void)dealloc
{
  _TtC16MusicApplication32CloudLibraryStatusViewController *v2;
  uint64_t *v3;
  uint64_t v4;
  void (*v5)(_TtC16MusicApplication32CloudLibraryStatusViewController *, char **, __n128);
  _TtC16MusicApplication32CloudLibraryStatusViewController *v6;
  __n128 v7;
  objc_super v8;

  v2 = self;
  v3 = CloudLibrary.StatusObserver.shared.unsafeMutableAddressor();
  v4 = *v3;
  v5 = *(void (**)(_TtC16MusicApplication32CloudLibraryStatusViewController *, char **, __n128))(*(_QWORD *)*v3 + 232);
  v6 = v2;
  v7 = swift_retain(v4);
  v5(v6, &off_1371FD8, v7);
  swift_release(v4);

  v8.receiver = v6;
  v8.super_class = (Class)type metadata accessor for CloudLibraryStatusViewController();
  -[CloudLibraryStatusViewController dealloc](&v8, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32CloudLibraryStatusViewController____lazy_storage___containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32CloudLibraryStatusViewController____lazy_storage___dismissButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32CloudLibraryStatusViewController____lazy_storage___messageLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32CloudLibraryStatusViewController____lazy_storage___actionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32CloudLibraryStatusViewController____lazy_storage___loadingView));
}

- (void)viewDidLoad
{
  _TtC16MusicApplication32CloudLibraryStatusViewController *v2;

  v2 = self;
  sub_5A3A58();

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication32CloudLibraryStatusViewController *v2;

  v2 = self;
  sub_5A3BC4();

}

- (void)music_viewInheritedLayoutInsetsDidChange
{
  id v2;
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CloudLibraryStatusViewController();
  v2 = v4.receiver;
  -[CloudLibraryStatusViewController music_viewInheritedLayoutInsetsDidChange](&v4, "music_viewInheritedLayoutInsetsDidChange");
  sub_5A4E5C(0, v3, 1);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  double *v8;
  void *v9;
  double *v10;
  id v11;
  _QWORD v12[5];
  double *v13;
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for CloudLibraryStatusViewController();
  swift_unknownObjectRetain(a4);
  v7 = v14.receiver;
  -[CloudLibraryStatusViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  v8 = (double *)swift_allocObject(&unk_1372020, 40, 7);
  *((_QWORD *)v8 + 2) = v7;
  v8[3] = width;
  v8[4] = height;
  v12[4] = sub_5A535C;
  v13 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_20B50C;
  v12[3] = &block_descriptor_152;
  v9 = _Block_copy(v12);
  v10 = v13;
  v11 = v7;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v9, 0, swift_release(v10).n128_f64[0]);
  _Block_release(v9);
  swift_unknownObjectRelease(a4);

}

- (_TtC16MusicApplication32CloudLibraryStatusViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC16MusicApplication32CloudLibraryStatusViewController *v9;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  v9 = (_TtC16MusicApplication32CloudLibraryStatusViewController *)sub_5A51E8(v5, v7, (uint64_t)a4);

  return v9;
}

- (_TtC16MusicApplication32CloudLibraryStatusViewController)initWithCoder:(id)a3
{
  id v3;
  _TtC16MusicApplication32CloudLibraryStatusViewController *v4;

  v3 = a3;
  v4 = (_TtC16MusicApplication32CloudLibraryStatusViewController *)sub_5A52AC((uint64_t)v3);

  return v4;
}

@end
