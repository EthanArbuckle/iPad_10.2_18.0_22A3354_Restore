@implementation ActionETADataSource

- (_TtC12SmartReplies19ActionETADataSource)init
{
  return (_TtC12SmartReplies19ActionETADataSource *)ActionETADataSource.init()();
}

- (void)navigationListener:(id)a3 didChangeNavigationState:(unint64_t)a4 transportType:(int)a5
{
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC12SmartReplies19ActionETADataSource_latestTransportType) = a5;
}

- (void)navigationListener:(id)a3 didUpdatePositionFromDestination:(id)a4
{
  $F24F406B2B787EFB06265DBA3D28CBD5 *v4;

  v4 = ($F24F406B2B787EFB06265DBA3D28CBD5 *)((char *)self
                                           + OBJC_IVAR____TtC12SmartReplies19ActionETADataSource_latestTimeAndPositionFromDestination);
  *v4 = a4;
  LOBYTE(v4[1].var0) = 0;
}

- (void).cxx_destruct
{

}

@end
