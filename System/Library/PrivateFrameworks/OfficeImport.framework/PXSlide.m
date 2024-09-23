@implementation PXSlide

+ (id)readFromPackagePart:(id)a3 presentationState:(id)a4
{
  id v5;
  id v6;
  PDSlide *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(PDSlide);
  objc_msgSend(v6, "OCXSlideLayoutRelationshipType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relationshipsByType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = v9;
  if (objc_msgSend(v9, "count") != 1)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  objc_msgSend(v9, "objectAtIndex:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "targetLocation");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modelObjectForLocation:", v34);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  -[PDSlide setSlideLayout:](v7, "setSlideLayout:", v10);
  objc_msgSend(v10, "slideMaster");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "theme");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "baseStyles");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "styleMatrix");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "officeArtState");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v17 && v18)
          objc_msgSend(v18, "setStyleMatrix:", v17);

      }
    }

  }
  +[PXSlideChild readFromPackagePart:toSlideChild:presentationState:](PXSlideChild, "readFromPackagePart:toSlideChild:presentationState:", v5, v7, v6);
  objc_msgSend(v6, "OCXCommentsRelationshipType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relationshipsByType:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v21, "count"))
  {
    if (objc_msgSend(v21, "count") != 1)
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    objc_msgSend(v21, "objectAtIndex:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "package");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "targetLocation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "partForLocation:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    +[PXComment readComments:slide:state:](PXComment, "readComments:slide:state:", v25, v7, v6);
    objc_msgSend(v5, "package");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "targetLocation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "resetPartForLocation:", v27);

  }
  -[PDSlide transition](v7, "transition");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transition");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setParent:", v29);

  objc_msgSend(v6, "resetOfficeArtState");
  objc_msgSend(v6, "OCXNotesSlideRelationshipType");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstPartWithRelationshipOfType:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    +[PXNotesSlide readFromPackagePart:presentationState:](PXNotesSlide, "readFromPackagePart:presentationState:", v31, v6);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDSlide setNotesSlide:](v7, "setNotesSlide:", v32);
    objc_msgSend(v6, "resetOfficeArtState");

  }
  return v7;
}

@end
