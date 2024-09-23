@implementation DOCBrowseStartingPointsDocumentSource

- (_TtC5Files37DOCBrowseStartingPointsDocumentSource)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCBrowseStartingPointsDocumentSource();
  return -[DOCBrowseStartingPointsDocumentSource initWithCoder:](&v5, "initWithCoder:", a3);
}

- (_TtC5Files37DOCBrowseStartingPointsDocumentSource)init
{
  _TtC5Files37DOCBrowseStartingPointsDocumentSource *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCBrowseStartingPointsDocumentSource();
  v2 = -[DOCBrowseStartingPointsDocumentSource init](&v4, "init");
  -[DOCBrowseStartingPointsDocumentSource setIdentifier:](v2, "setIdentifier:", DOCDocumentSourceIdentifierBrowseStartingPoints);
  return v2;
}

@end
