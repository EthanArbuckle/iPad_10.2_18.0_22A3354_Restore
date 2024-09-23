@implementation THNotesViewSection

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THNotesViewSection;
  -[THNotesViewSection dealloc](&v3, "dealloc");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  void *v6;
  double v7;
  void *v8;
  NSString *mTitle;
  NSString *mChapterTitle;
  NSArray *mNotes;

  v5 = objc_opt_class(THNotesViewSection);
  *(_QWORD *)&v7 = TSUDynamicCast(v5, a3).n128_u64[0];
  if (v6)
  {
    v8 = v6;
    mTitle = self->mTitle;
    if (mTitle == objc_msgSend(v6, "title", v7)
      || (LODWORD(v6) = -[NSString isEqualToString:](self->mTitle, "isEqualToString:", objc_msgSend(v8, "title")),
          (_DWORD)v6))
    {
      mChapterTitle = self->mChapterTitle;
      if (mChapterTitle == objc_msgSend(v8, "chapterTitle")
        || (LODWORD(v6) = -[NSString isEqualToString:](self->mChapterTitle, "isEqualToString:", objc_msgSend(v8, "chapterTitle")), (_DWORD)v6))
      {
        mNotes = self->mNotes;
        if (mNotes == objc_msgSend(v8, "notes"))
          LOBYTE(v6) = 1;
        else
          LOBYTE(v6) = -[NSArray isEqualToArray:](self->mNotes, "isEqualToArray:", objc_msgSend(v8, "notes"));
      }
    }
  }
  return (char)v6;
}

- (NSString)title
{
  return self->mTitle;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSArray)notes
{
  return self->mNotes;
}

- (void)setNotes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)chapterTitle
{
  return self->mChapterTitle;
}

- (void)setChapterTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
