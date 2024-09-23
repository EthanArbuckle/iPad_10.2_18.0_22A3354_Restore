@implementation CLKeyboardMotionAdapter

- (void)inputReportForDevice:(id)a3 report:(char *)a4 length:(int64_t)a5
{
  if (qword_1023059D8 != -1)
    dispatch_once(&qword_1023059D8, &stru_10215FAD8);
  sub_1009545E0(qword_102311040, (uint64_t)a3, a4, a5);
}

- (void)monitorUpdateForDevice:(id)a3 added:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  if (qword_1023059D8 != -1)
    dispatch_once(&qword_1023059D8, &stru_10215FAD8);
  sub_100954C4C((_BYTE *)qword_102311040, (uint64_t)a3, v4);
}

- (void)eventUpdateForDevice:(id)a3 event:(id)a4
{
  if (qword_1023059D8 != -1)
    dispatch_once(&qword_1023059D8, &stru_10215FAD8);
  sub_100954D9C(qword_102311040, (uint64_t)a4);
}

- (void)smartCoverStateDidChange:(int64_t)a3
{
  if (qword_1023059D8 != -1)
    dispatch_once(&qword_1023059D8, &stru_10215FAD8);
  sub_100954EC0(qword_102311040, a3);
}

@end
