@implementation SearchResultsViewController.Header

- (_TtCC16MusicApplication27SearchResultsViewControllerP33_ECEB0A228643F5C5A0ED18BD126DBF576Header)initWithFrame:(CGRect)a3
{
  return (_TtCC16MusicApplication27SearchResultsViewControllerP33_ECEB0A228643F5C5A0ED18BD126DBF576Header *)sub_79763C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC16MusicApplication27SearchResultsViewControllerP33_ECEB0A228643F5C5A0ED18BD126DBF576Header)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_79B224();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtCC16MusicApplication27SearchResultsViewControllerP33_ECEB0A228643F5C5A0ED18BD126DBF576Header *v6;

  v5 = a3;
  v6 = self;
  sub_797CA8((uint64_t)a3);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtCC16MusicApplication27SearchResultsViewControllerP33_ECEB0A228643F5C5A0ED18BD126DBF576Header_buttonHandler), *(_QWORD *)&self->title[OBJC_IVAR____TtCC16MusicApplication27SearchResultsViewControllerP33_ECEB0A228643F5C5A0ED18BD126DBF576Header_buttonHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication27SearchResultsViewControllerP33_ECEB0A228643F5C5A0ED18BD126DBF576Header_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication27SearchResultsViewControllerP33_ECEB0A228643F5C5A0ED18BD126DBF576Header_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication27SearchResultsViewControllerP33_ECEB0A228643F5C5A0ED18BD126DBF576Header____lazy_storage___button));
}

@end
