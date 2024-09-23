@implementation AmbientCollectionViewCell

- (_TtC11PosterBoard25AmbientCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC11PosterBoard25AmbientCollectionViewCell *)sub_1CBB0F39C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11PosterBoard25AmbientCollectionViewCell)initWithCoder:(id)a3
{
  return (_TtC11PosterBoard25AmbientCollectionViewCell *)sub_1CBB0F578(a3);
}

- (void)ambientEditingCollectionViewControllerDidUpdatePosters:(id)a3
{
  id v4;
  _TtC11PosterBoard25AmbientCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1CBB11510();

}

- (void)ambientEditingCollectionViewController:(id)a3 didUpdatePosterConfiguration:(id)a4
{
  id v6;
  id v7;
  _TtC11PosterBoard25AmbientCollectionViewCell *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1CBB123C4(v7);

}

- (id)ambientPosterViewControllerRequestExtensionInstanceIdentifier:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  _TtC11PosterBoard25AmbientCollectionViewCell *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED89A0B0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (MEMORY[0x1D17A3DF0]((char *)self + OBJC_IVAR____TtC11PosterBoard25AmbientCollectionViewCell_delegate))
  {
    v8 = a3;
    v9 = self;
    sub_1CBB24214((uint64_t)v7);

    swift_unknownObjectRelease();
    v10 = sub_1CBB8225C();
    v11 = *(_QWORD *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) != 1)
    {
      v12 = (void *)sub_1CBB8222C();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v10);
      return v12;
    }
  }
  else
  {
    v14 = sub_1CBB8225C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v7, 1, 1, v14);
  }
  return 0;
}

- (void)ambientPosterViewController:(id)a3 relinquishExtensionInstanceIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC11PosterBoard25AmbientCollectionViewCell *v11;
  uint64_t v12;

  v6 = sub_1CBB8225C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CBB82244();
  v10 = a3;
  v11 = self;
  sub_1CBB12920((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void).cxx_destruct
{
  sub_1CBAEE45C((uint64_t)self + OBJC_IVAR____TtC11PosterBoard25AmbientCollectionViewCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard25AmbientCollectionViewCell_posterModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard25AmbientCollectionViewCell_editingButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard25AmbientCollectionViewCell_hideOrDeleteButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard25AmbientCollectionViewCell_editingViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard25AmbientCollectionViewCell_ambientPosterViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard25AmbientCollectionViewCell_shadowView));
}

@end
