@implementation StoryColorGradeEditorItemHitTestResult

- (_TtC15PhotosUIPrivate38StoryColorGradeEditorItemHitTestResult)initWithSpriteReference:(id)a3 layout:(id)a4 identifier:(id)a5 userDataProvider:(id)a6
{
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  v9 = _Block_copy(a6);
  if (v9)
  {
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v9;
    v9 = sub_1AABFEDF0;
  }
  else
  {
    v10 = 0;
  }
  v11 = a3;
  v12 = a4;
  v13 = a5;
  return (_TtC15PhotosUIPrivate38StoryColorGradeEditorItemHitTestResult *)sub_1AABFEB98(v11, a4, a5, (uint64_t)v9, v10);
}

@end
