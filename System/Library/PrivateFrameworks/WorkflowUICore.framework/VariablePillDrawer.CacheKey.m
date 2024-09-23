@implementation VariablePillDrawer.CacheKey

- (int64_t)hash
{
  _TtCC14WorkflowUICore18VariablePillDrawerP33_9CD4534EC423F0CF964556D030CC849B8CacheKey *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_2270F1B24();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtCC14WorkflowUICore18VariablePillDrawerP33_9CD4534EC423F0CF964556D030CC849B8CacheKey *v4;
  _TtCC14WorkflowUICore18VariablePillDrawerP33_9CD4534EC423F0CF964556D030CC849B8CacheKey *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_227101880();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_2270F1C40((uint64_t)v8);

  sub_22707FC34((uint64_t)v8);
  return v6 & 1;
}

- (_TtCC14WorkflowUICore18VariablePillDrawerP33_9CD4534EC423F0CF964556D030CC849B8CacheKey)init
{
  sub_2270F1EA8();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC14WorkflowUICore18VariablePillDrawerP33_9CD4534EC423F0CF964556D030CC849B8CacheKey_font));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC14WorkflowUICore18VariablePillDrawerP33_9CD4534EC423F0CF964556D030CC849B8CacheKey_icon));
}

@end
