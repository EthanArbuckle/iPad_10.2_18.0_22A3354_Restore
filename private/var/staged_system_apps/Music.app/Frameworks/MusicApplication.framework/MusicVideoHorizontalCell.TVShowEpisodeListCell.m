@implementation MusicVideoHorizontalCell.TVShowEpisodeListCell

- (_TtCC16MusicApplication24MusicVideoHorizontalCell21TVShowEpisodeListCell)initWithFrame:(CGRect)a3
{
  return (_TtCC16MusicApplication24MusicVideoHorizontalCell21TVShowEpisodeListCell *)sub_A614F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC16MusicApplication24MusicVideoHorizontalCell21TVShowEpisodeListCell)initWithCoder:(id)a3
{
  unsigned __int8 *v5;
  uint64_t v6;
  id v7;
  _TtCC16MusicApplication24MusicVideoHorizontalCell21TVShowEpisodeListCell *result;

  v5 = &self->super.super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtCC16MusicApplication24MusicVideoHorizontalCell21TVShowEpisodeListCell_releaseDate];
  v6 = type metadata accessor for Date(0);
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = a3;

  result = (_TtCC16MusicApplication24MusicVideoHorizontalCell21TVShowEpisodeListCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/MusicVideoHorizontalCell.swift", 47, 2, 155, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_812730((uint64_t)self + OBJC_IVAR____TtCC16MusicApplication24MusicVideoHorizontalCell21TVShowEpisodeListCell_releaseDate);
}

@end
