@implementation PGTripCollectionTitleGenerator

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  void (**v4)(id, void *, void *);
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  char v9;
  PGTripMemoryTitleGenerator *v10;
  void *v11;
  void *v12;
  PGTripMemoryTitleGenerator *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  objc_super v18;
  uint8_t buf[16];

  v4 = (void (**)(id, void *, void *))a3;
  -[PGDefaultCollectionTitleGenerator collection](self, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isLongTrip");

  if ((v6 & 1) != 0)
  {
    v7 = 0;
LABEL_5:
    v10 = [PGTripMemoryTitleGenerator alloc];
    -[PGTitleGenerator momentNodes](self, "momentNodes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGTitleGenerator titleGenerationContext](self, "titleGenerationContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PGTripMemoryTitleGenerator initWithMomentNodes:type:titleGenerationContext:](v10, "initWithMomentNodes:type:titleGenerationContext:", v11, v7, v12);

    if (v4)
    {
      -[PGTitleGenerator title](v13, "title");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGTitleGenerator subtitle](v13, "subtitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v14, v15);

    }
    goto LABEL_11;
  }
  -[PGDefaultCollectionTitleGenerator collection](self, "collection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isShortTrip");

  if ((v9 & 1) != 0)
  {
    v7 = 1;
    goto LABEL_5;
  }
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "loggingConnection");
  v17 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CA237000, v17, OS_LOG_TYPE_ERROR, "Collection is not a trip, can't use trip collection title generator", buf, 2u);
  }

  v18.receiver = self;
  v18.super_class = (Class)PGTripCollectionTitleGenerator;
  -[PGTitleGenerator _generateTitleAndSubtitleWithResult:](&v18, sel__generateTitleAndSubtitleWithResult_, v4);
LABEL_11:

}

@end
