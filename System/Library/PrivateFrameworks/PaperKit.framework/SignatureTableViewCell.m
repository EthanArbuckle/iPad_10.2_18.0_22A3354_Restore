@implementation SignatureTableViewCell

- (_TtC8PaperKit22SignatureTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC8PaperKit22SignatureTableViewCell *)@objc SignatureTableViewCell.init(style:reuseIdentifier:)((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, SignatureTableViewCell.init(style:reuseIdentifier:));
}

- (_TtC8PaperKit22SignatureTableViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized SignatureTableViewCell.init(coder:)();
}

- (void)updateConstraints
{
  char *v2;
  void *v3;
  char *v4;
  unsigned int v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SignatureTableViewCell();
  v2 = (char *)v7.receiver;
  -[SignatureTableViewCell updateConstraints](&v7, sel_updateConstraints);
  v3 = *(void **)&v2[OBJC_IVAR____TtC8PaperKit22SignatureTableViewCell_signatureViewLeadingConstraint];
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v2, sel_isEditing, v7.receiver, v7.super_class);
    v6 = 30.0;
    if (v5)
      v6 = 15.0;
    objc_msgSend(v4, sel_setConstant_, v6);

    v2 = v4;
  }

}

- (void)layoutSubviews
{
  _TtC8PaperKit22SignatureTableViewCell *v2;

  v2 = self;
  SignatureTableViewCell.layoutSubviews()();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit22SignatureTableViewCell_signatureView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit22SignatureTableViewCell_signature));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit22SignatureTableViewCell_signatureViewLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit22SignatureTableViewCell_signatureViewTrailingConstraint));
}

@end
