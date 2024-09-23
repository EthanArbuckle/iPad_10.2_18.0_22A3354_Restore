@implementation ArtistViewController

- (_TtC16MusicApplication20ArtistViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_4811E0();
}

- (void)viewDidLoad
{
  _TtC16MusicApplication20ArtistViewController *v2;

  v2 = self;
  sub_478638();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  char v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = v6.receiver;
  -[VerticalStackViewController viewWillAppear:](&v6, "viewWillAppear:", v3);
  v5 = v4[OBJC_IVAR____TtC16MusicApplication20ArtistViewController__visible];
  v4[OBJC_IVAR____TtC16MusicApplication20ArtistViewController__visible] = 1;
  if ((v5 & 1) == 0)
    sub_47C788();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  int v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = v6.receiver;
  -[VerticalStackViewController viewWillDisappear:](&v6, "viewWillDisappear:", v3);
  v5 = v4[OBJC_IVAR____TtC16MusicApplication20ArtistViewController__visible];
  v4[OBJC_IVAR____TtC16MusicApplication20ArtistViewController__visible] = 0;
  if (v5 == 1)
    sub_47C788();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC16MusicApplication20ArtistViewController *v4;

  v4 = self;
  sub_479848(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication20ArtistViewController *v2;

  v2 = self;
  sub_479A34();

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC16MusicApplication20ArtistViewController *v5;

  v4 = a3;
  v5 = self;
  sub_481438();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication20ArtistViewController *v6;

  v5 = a3;
  v6 = self;
  sub_47A0A8((uint64_t)a3);

}

- (void)music_viewInheritedLayoutInsetsDidChange
{
  id v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(_BYTE *, _QWORD);
  _QWORD *v15;
  _BYTE v16[32];
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)swift_getObjectType();
  v2 = v17.receiver;
  -[ArtistViewController music_viewInheritedLayoutInsetsDidChange](&v17, "music_viewInheritedLayoutInsetsDidChange");
  v3 = sub_479DFC();
  v4 = objc_msgSend(v2, "view");
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "music_inheritedLayoutInsets");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    v14 = (void (*)(_BYTE *, _QWORD))dispatch thunk of UIHostingController.rootView.modify(v16);
    v15[3] = v7;
    v15[4] = v9;
    v15[5] = v11;
    v15[6] = v13;
    v14(v16, 0);

  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20ArtistViewController_artist));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication20ArtistViewController____lazy_storage___contentFilteringController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication20ArtistViewController_sortOptionsController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication20ArtistViewController____lazy_storage___noFilteredContentStateController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication20ArtistViewController_textDrawingCache));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20ArtistViewController____lazy_storage___artistHeaderViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20ArtistViewController____lazy_storage___startStationViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20ArtistViewController_playIntentControlsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20ArtistViewController_albumsTitleViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20ArtistViewController_albumsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20ArtistViewController_albumsMusicVideosSpacingViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20ArtistViewController_musicVideosTitleViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20ArtistViewController_musicVideosViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20ArtistViewController____lazy_storage___musicVideosPickerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20ArtistViewController_artistHeaderResponse));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20ArtistViewController_albumsResponse));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20ArtistViewController_musicVideosResponse));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication20ArtistViewController_networkConnectivityObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20ArtistViewController____lazy_storage___contextBarButtonItem));
  sub_15C188(*(id *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC16MusicApplication20ArtistViewController____lazy_storage___favoriteButton));
  sub_15C188(*(id *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC16MusicApplication20ArtistViewController____lazy_storage___favoriteBarButtonItem));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication20ArtistViewController__artistStorePusher));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication20ArtistViewController_responseInvalidationObserver));
}

@end
