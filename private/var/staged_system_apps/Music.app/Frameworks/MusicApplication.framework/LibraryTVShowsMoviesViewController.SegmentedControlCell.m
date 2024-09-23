@implementation LibraryTVShowsMoviesViewController.SegmentedControlCell

- (_TtCC16MusicApplication34LibraryTVShowsMoviesViewControllerP33_2F690B8327CA8932CF77A6A6B26B256320SegmentedControlCell)initWithFrame:(CGRect)a3
{
  return (_TtCC16MusicApplication34LibraryTVShowsMoviesViewControllerP33_2F690B8327CA8932CF77A6A6B26B256320SegmentedControlCell *)sub_56788C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC16MusicApplication34LibraryTVShowsMoviesViewControllerP33_2F690B8327CA8932CF77A6A6B26B256320SegmentedControlCell)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtCC16MusicApplication34LibraryTVShowsMoviesViewControllerP33_2F690B8327CA8932CF77A6A6B26B256320SegmentedControlCell *result;

  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtCC16MusicApplication34LibraryTVShowsMoviesViewControllerP33_2F690B8327CA8932CF77A6A6B26B256320SegmentedControlCell_currentSelection) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtCC16MusicApplication34LibraryTVShowsMoviesViewControllerP33_2F690B8327CA8932CF77A6A6B26B256320SegmentedControlCell_selectionDidChange);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication34LibraryTVShowsMoviesViewControllerP33_2F690B8327CA8932CF77A6A6B26B256320SegmentedControlCell____lazy_storage___segmentedControl) = 0;
  v5 = a3;

  result = (_TtCC16MusicApplication34LibraryTVShowsMoviesViewControllerP33_2F690B8327CA8932CF77A6A6B26B256320SegmentedControlCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/LibraryTVShowsMoviesViewController.swift", 57, 2, 521, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtCC16MusicApplication34LibraryTVShowsMoviesViewControllerP33_2F690B8327CA8932CF77A6A6B26B256320SegmentedControlCell_selectionDidChange), *(_QWORD *)&self->currentSelection[OBJC_IVAR____TtCC16MusicApplication34LibraryTVShowsMoviesViewControllerP33_2F690B8327CA8932CF77A6A6B26B256320SegmentedControlCell_selectionDidChange]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication34LibraryTVShowsMoviesViewControllerP33_2F690B8327CA8932CF77A6A6B26B256320SegmentedControlCell____lazy_storage___segmentedControl));
}

@end
