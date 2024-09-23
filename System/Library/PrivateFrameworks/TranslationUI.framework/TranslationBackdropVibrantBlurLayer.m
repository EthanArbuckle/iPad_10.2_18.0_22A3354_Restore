@implementation TranslationBackdropVibrantBlurLayer

- (void)layoutSublayers
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  _TtC13TranslationUIP33_CF4489C12E47B589A5779A16E606AB3135TranslationBackdropVibrantBlurLayer *v11;

  v11 = self;
  -[TranslationBackdropVibrantBlurLayer bounds](v11, sel_bounds);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = (void *)objc_opt_self();
  objc_msgSend(v10, sel_begin);
  objc_msgSend(v10, sel_setDisableActions_, 1);
  objc_msgSend(*(id *)((char *)&v11->super.super.isa+ OBJC_IVAR____TtC13TranslationUIP33_CF4489C12E47B589A5779A16E606AB3135TranslationBackdropVibrantBlurLayer_backdropLayer), sel_setFrame_, v3, v5, v7, v9);
  objc_msgSend(v10, sel_commit);

}

- (_TtC13TranslationUIP33_CF4489C12E47B589A5779A16E606AB3135TranslationBackdropVibrantBlurLayer)init
{
  objc_class *ObjectType;
  uint64_t v4;
  id v5;
  _TtC13TranslationUIP33_CF4489C12E47B589A5779A16E606AB3135TranslationBackdropVibrantBlurLayer *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR____TtC13TranslationUIP33_CF4489C12E47B589A5779A16E606AB3135TranslationBackdropVibrantBlurLayer_backdropLayer;
  v5 = objc_allocWithZone(MEMORY[0x1E0CD2708]);
  v6 = self;
  *(Class *)((char *)&self->super.super.isa + v4) = (Class)objc_msgSend(v5, sel_init);

  v8.receiver = v6;
  v8.super_class = ObjectType;
  return -[TranslationBackdropVibrantBlurLayer init](&v8, sel_init);
}

- (_TtC13TranslationUIP33_CF4489C12E47B589A5779A16E606AB3135TranslationBackdropVibrantBlurLayer)initWithLayer:(id)a3
{
  objc_class *ObjectType;
  uint64_t v5;
  id v6;
  _TtC13TranslationUIP33_CF4489C12E47B589A5779A16E606AB3135TranslationBackdropVibrantBlurLayer *v7;
  uint64_t v8;
  _TtC13TranslationUIP33_CF4489C12E47B589A5779A16E606AB3135TranslationBackdropVibrantBlurLayer *v9;
  objc_super v11;
  _QWORD v12[4];

  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectRetain();
  sub_1D2D9E214();
  swift_unknownObjectRelease();
  v5 = OBJC_IVAR____TtC13TranslationUIP33_CF4489C12E47B589A5779A16E606AB3135TranslationBackdropVibrantBlurLayer_backdropLayer;
  v6 = objc_allocWithZone(MEMORY[0x1E0CD2708]);
  v7 = self;
  *(Class *)((char *)&self->super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  __swift_project_boxed_opaque_existential_1(v12, v12[3]);
  v8 = sub_1D2D9E520();
  v11.receiver = v7;
  v11.super_class = ObjectType;
  v9 = -[TranslationBackdropVibrantBlurLayer initWithLayer:](&v11, sel_initWithLayer_, v8);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v9;
}

- (_TtC13TranslationUIP33_CF4489C12E47B589A5779A16E606AB3135TranslationBackdropVibrantBlurLayer)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  id v7;
  id v8;
  _TtC13TranslationUIP33_CF4489C12E47B589A5779A16E606AB3135TranslationBackdropVibrantBlurLayer *v9;
  _TtC13TranslationUIP33_CF4489C12E47B589A5779A16E606AB3135TranslationBackdropVibrantBlurLayer *v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = OBJC_IVAR____TtC13TranslationUIP33_CF4489C12E47B589A5779A16E606AB3135TranslationBackdropVibrantBlurLayer_backdropLayer;
  v7 = objc_allocWithZone(MEMORY[0x1E0CD2708]);
  v8 = a3;
  v9 = self;
  *(Class *)((char *)&self->super.super.isa + v6) = (Class)objc_msgSend(v7, sel_init);

  v12.receiver = v9;
  v12.super_class = ObjectType;
  v10 = -[TranslationBackdropVibrantBlurLayer initWithCoder:](&v12, sel_initWithCoder_, v8);

  return v10;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC13TranslationUIP33_CF4489C12E47B589A5779A16E606AB3135TranslationBackdropVibrantBlurLayer_backdropLayer));
}

@end
