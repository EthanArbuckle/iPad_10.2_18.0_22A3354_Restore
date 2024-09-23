@implementation PDNotesSlide

- (PDNotesSlide)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDNotesSlide;
  return -[PDSlideChild init](&v3, sel_init);
}

- (void)setNotesMaster:(id)a3
{
  objc_storeStrong((id *)&self->super.mColorMapOverride, a3);
}

- (id)parentSlideBase
{
  return self->super.mColorMapOverride;
}

- (id)parentTextStyleForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 defaultTextListStyle:(id)a5 overrideIndex:(BOOL)a6
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  -[PDNotesSlide notesMaster](self, "notesMaster");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((_DWORD)v6 == 1)
  {
    objc_msgSend(v9, "notesTextStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PDNotesSlide masterPlaceholderOfType:](self, "masterPlaceholderOfType:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textBody");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "textListStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v11)
    v14 = v11;
  else
    v14 = v8;
  v15 = v14;

  return v15;
}

- (id)notesMaster
{
  return self->super.mColorMapOverride;
}

- (id)parentTextBodyPropertiesForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5
{
  void *v5;
  void *v6;
  void *v7;

  -[PDNotesSlide masterPlaceholderOfType:](self, "masterPlaceholderOfType:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)parentShapePropertiesForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5
{
  void *v5;
  void *v6;

  -[PDNotesSlide masterPlaceholderOfType:](self, "masterPlaceholderOfType:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shapeProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)masterPlaceholderOfType:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  -[PDNotesSlide notesMaster](self, "notesMaster");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placeholderWithType:placeholderTypeIndex:overrideIndex:", v3, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)doneWithContent
{
  OADColorMap *mColorMapOverride;
  objc_super v4;

  mColorMapOverride = self->super.mColorMapOverride;
  self->super.mColorMapOverride = 0;

  v4.receiver = self;
  v4.super_class = (Class)PDNotesSlide;
  -[PDSlideChild doneWithContent](&v4, sel_doneWithContent);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDNotesSlide;
  -[PDSlideChild description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->super.mColorMapOverride, 0);
}

@end
