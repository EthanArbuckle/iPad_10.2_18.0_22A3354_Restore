@implementation APPCContextBuilder

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___APPCContextBuilder_identifier;
  v4 = sub_1B1289674();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (NSUUID)identifier
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_1B1289674();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR___APPCContextBuilder_identifier;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = (void *)sub_1B1289644();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)v8;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  void (*v9)(char *, char *, uint64_t);
  APPCContextBuilder *v10;
  uint64_t v11;

  v4 = sub_1B1289674();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B128965C();
  v8 = (char *)self + OBJC_IVAR___APPCContextBuilder_identifier;
  swift_beginAccess();
  v9 = *(void (**)(char *, char *, uint64_t))(v5 + 40);
  v10 = self;
  v9(v8, v7, v4);
  swift_endAccess();

}

- (CGSize)maxSize
{
  double *v2;
  double v3;
  double v4;
  CGSize result;

  v2 = (double *)((char *)self + OBJC_IVAR___APPCContextBuilder_maxSize);
  swift_beginAccess();
  v3 = *v2;
  v4 = v2[1];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setMaxSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat *v5;

  height = a3.height;
  width = a3.width;
  v5 = (CGFloat *)((char *)self + OBJC_IVAR___APPCContextBuilder_maxSize);
  swift_beginAccess();
  *v5 = width;
  v5[1] = height;
}

- (APPCPromotableContentDepiction)current
{
  swift_beginAccess();
  return (APPCPromotableContentDepiction *)(id)swift_unknownObjectRetain();
}

- (void)setCurrent:(id)a3
{
  APPCContextBuilder *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1B12207F8(a3);

  swift_unknownObjectRelease();
}

- (NSArray)next
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1B11FFBAC(&qword_1ED390B50);
  v2 = (void *)sub_1B1289938();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setNext:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  sub_1B11FFBAC(&qword_1ED390B50);
  v4 = sub_1B1289944();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___APPCContextBuilder_next);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSArray)adjacent
{
  void *v2;
  APPCContextBuilder *v3;
  void *v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCContextBuilder_resourceLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  objc_msgSend(v2, sel_unlock);

  sub_1B11FFBAC(&qword_1ED390B50);
  v4 = (void *)sub_1B1289938();
  swift_bridgeObjectRelease();
  return (NSArray *)v4;
}

- (NSString)requestedAd
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___APPCContextBuilder_requestedAd;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_1B1289878();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setRequestedAd:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  if (a3)
  {
    v4 = sub_1B1289884();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___APPCContextBuilder_requestedAd);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (APPCNewsSupplementalContext)newsContext
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___APPCContextBuilder_newsContext);
  swift_beginAccess();
  return (APPCNewsSupplementalContext *)*v2;
}

- (void)setNewsContext:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___APPCContextBuilder_newsContext);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (APPCContext)context
{
  APPCContextBuilder *v2;
  char *v3;

  v2 = self;
  v3 = sub_1B11F9EEC();

  return (APPCContext *)v3;
}

- (APPCContextBuilder)initWithMaxSize:(CGSize)a3 current:(id)a4 next:(id)a5 newsContext:(id)a6 requestedAd:(id)a7
{
  double height;
  double width;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  APPCContextBuilder *v16;

  height = a3.height;
  width = a3.width;
  sub_1B11FFBAC(&qword_1ED390B50);
  v11 = sub_1B1289944();
  if (a7)
  {
    a7 = (id)sub_1B1289884();
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }
  v14 = a6;
  v15 = swift_unknownObjectRetain();
  v16 = (APPCContextBuilder *)sub_1B12208A8(v15, v11, a6, (uint64_t)a7, v13, width, height);
  swift_unknownObjectRelease();

  return v16;
}

- (APPCContextBuilder)initWithMaxSize:(CGSize)a3 current:(id)a4 newsContext:(id)a5 requestedAd:(id)a6
{
  double height;
  double width;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  APPCContextBuilder *v14;

  height = a3.height;
  width = a3.width;
  if (a6)
  {
    v10 = sub_1B1289884();
    v12 = v11;
  }
  else
  {
    v10 = 0;
    v12 = 0;
  }
  swift_unknownObjectRetain();
  v13 = a5;
  v14 = (APPCContextBuilder *)sub_1B11ECF14((uint64_t)a4, a5, v10, v12, width, height);
  swift_unknownObjectRelease();

  return v14;
}

- (BOOL)addAdjacentWithAdjacent:(id)a3 error:(id *)a4
{
  APPCContextBuilder *v6;

  swift_unknownObjectRetain();
  v6 = self;
  sub_1B11EF354(a3);

  swift_unknownObjectRelease();
  return 1;
}

- (void)removeAdjacentWithAdjacent:(id)a3
{
  void *v5;
  APPCContextBuilder *v6;
  unint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCContextBuilder_resourceLock);
  swift_unknownObjectRetain();
  v6 = self;
  objc_msgSend(v5, sel_lock);
  v7 = (unint64_t *)((char *)v6 + OBJC_IVAR___APPCContextBuilder_adjacentInternal);
  swift_beginAccess();
  swift_unknownObjectRetain();
  v8 = sub_1B1220A88(v7, a3);
  swift_unknownObjectRelease();
  if (*v7 >> 62)
  {
    swift_bridgeObjectRetain();
    v9 = sub_1B1289D1C();
    swift_bridgeObjectRelease();
    if (v9 >= v8)
      goto LABEL_3;
  }
  else
  {
    v9 = *(_QWORD *)((*v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v9 >= v8)
    {
LABEL_3:
      sub_1B1220E68(v8, v9);
      swift_endAccess();
      objc_msgSend(v5, sel_unlock);
      swift_unknownObjectRelease();

      return;
    }
  }
  __break(1u);
}

- (APPCContextBuilder)init
{
  APPCContextBuilder *result;

  result = (APPCContextBuilder *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
