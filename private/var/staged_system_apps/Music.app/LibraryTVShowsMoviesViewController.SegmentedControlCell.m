@implementation LibraryTVShowsMoviesViewController.SegmentedControlCell

- (_TtCC5Music34LibraryTVShowsMoviesViewControllerP33_93C7FD7BE2577186821DBE5ED4FA54AB20SegmentedControlCell)initWithFrame:(CGRect)a3
{
  return (_TtCC5Music34LibraryTVShowsMoviesViewControllerP33_93C7FD7BE2577186821DBE5ED4FA54AB20SegmentedControlCell *)sub_1008B4DFC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC5Music34LibraryTVShowsMoviesViewControllerP33_93C7FD7BE2577186821DBE5ED4FA54AB20SegmentedControlCell)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtCC5Music34LibraryTVShowsMoviesViewControllerP33_93C7FD7BE2577186821DBE5ED4FA54AB20SegmentedControlCell *result;

  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtCC5Music34LibraryTVShowsMoviesViewControllerP33_93C7FD7BE2577186821DBE5ED4FA54AB20SegmentedControlCell_currentSelection) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtCC5Music34LibraryTVShowsMoviesViewControllerP33_93C7FD7BE2577186821DBE5ED4FA54AB20SegmentedControlCell_selectionDidChange);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtCC5Music34LibraryTVShowsMoviesViewControllerP33_93C7FD7BE2577186821DBE5ED4FA54AB20SegmentedControlCell____lazy_storage___segmentedControl) = 0;
  v5 = a3;

  result = (_TtCC5Music34LibraryTVShowsMoviesViewControllerP33_93C7FD7BE2577186821DBE5ED4FA54AB20SegmentedControlCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/LibraryTVShowsMoviesViewController.swift", 46, 2, 521, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtCC5Music34LibraryTVShowsMoviesViewControllerP33_93C7FD7BE2577186821DBE5ED4FA54AB20SegmentedControlCell_selectionDidChange), *(_QWORD *)&self->currentSelection[OBJC_IVAR____TtCC5Music34LibraryTVShowsMoviesViewControllerP33_93C7FD7BE2577186821DBE5ED4FA54AB20SegmentedControlCell_selectionDidChange]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC5Music34LibraryTVShowsMoviesViewControllerP33_93C7FD7BE2577186821DBE5ED4FA54AB20SegmentedControlCell____lazy_storage___segmentedControl));
}

@end
