@implementation MapsDragAndDropManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005D3088;
  block[3] = &unk_1011ACF48;
  block[4] = a1;
  if (qword_1014D2A50 != -1)
    dispatch_once(&qword_1014D2A50, block);
  return (id)qword_1014D2A48;
}

- (BOOL)canStartNewDrag
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDragAndDropManager dragSession](self, "dragSession"));
  v3 = v2 == 0;

  return v3;
}

- (BOOL)deviceSupportsDragAndDrop
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = (unint64_t)objc_msgSend(v2, "userInterfaceIdiom");

  return (v3 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (UIDragSession)dragSession
{
  return self->_dragSession;
}

- (void)setDragSession:(id)a3
{
  objc_storeStrong((id *)&self->_dragSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragSession, 0);
}

@end
