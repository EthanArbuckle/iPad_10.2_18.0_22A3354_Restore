@implementation DOCCircularProgressView

- (_TtC5FilesP33_6C1A47974E8480CF19F978326BC049AE23DOCCircularProgressView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002AEC28();
}

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCCircularProgressView();
  v2 = v3.receiver;
  -[DOCCircularProgressView tintColorDidChange](&v3, "tintColorDidChange");
  sub_1000AACD8();

}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4;
  _TtC5FilesP33_6C1A47974E8480CF19F978326BC049AE23DOCCircularProgressView *v5;

  v4 = a3;
  v5 = self;
  sub_1002AE678(v4);

}

- (_TtC5FilesP33_6C1A47974E8480CF19F978326BC049AE23DOCCircularProgressView)initWithFrame:(CGRect)a3
{
  sub_100226BB0((uint64_t)self, (uint64_t)a2, (uint64_t)"Files.DOCCircularProgressView", 29);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5FilesP33_6C1A47974E8480CF19F978326BC049AE23DOCCircularProgressView_borderLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5FilesP33_6C1A47974E8480CF19F978326BC049AE23DOCCircularProgressView_progressLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5FilesP33_6C1A47974E8480CF19F978326BC049AE23DOCCircularProgressView_indeterminateLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5FilesP33_6C1A47974E8480CF19F978326BC049AE23DOCCircularProgressView_preferredIconColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5FilesP33_6C1A47974E8480CF19F978326BC049AE23DOCCircularProgressView_progressBorderColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5FilesP33_6C1A47974E8480CF19F978326BC049AE23DOCCircularProgressView_progressFillColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5FilesP33_6C1A47974E8480CF19F978326BC049AE23DOCCircularProgressView_progressBackgroundColor));
}

@end
