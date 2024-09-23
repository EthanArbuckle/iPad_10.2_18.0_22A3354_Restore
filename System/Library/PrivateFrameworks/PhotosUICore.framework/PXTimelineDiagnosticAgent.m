@implementation PXTimelineDiagnosticAgent

+ (id)timelineDiagnosticForWidgetSize:(id)a3 jsonFormat:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  id v29;
  BOOL v30;
  const __CFString *v31;
  _QWORD v32[2];

  v4 = a4;
  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("small")))
    {
      +[PXTimelineSize widgetSizeForSizeClass:](PXTimelineSize, "widgetSizeForSizeClass:", 0);
      v8 = v7;
      v10 = v9;
      v11 = 0;
    }
    else
    {
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("medium")))
      {
        v11 = 1;
        v12 = 1;
      }
      else if (objc_msgSend(v6, "isEqualToString:", CFSTR("large")))
      {
        v11 = 2;
        v12 = 2;
      }
      else
      {
        if (!objc_msgSend(v6, "isEqualToString:", CFSTR("extraLarge")))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported widget size: %@. Only support small, medium, large or extraLarge"), v6);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "errorMessage:jsonFormat:", v15, v4);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        }
        v11 = 3;
        v12 = 3;
      }
      +[PXTimelineSize widgetSizeForSizeClass:](PXTimelineSize, "widgetSizeForSizeClass:", v12);
      v8 = v13;
      v10 = v14;
    }
  }
  else
  {
    v11 = 0;
    v8 = *MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXWidgetTimeline timelineFromLibrary:forWidgetSize:timelineSize:](PXWidgetTimeline, "timelineFromLibrary:forWidgetSize:timelineSize:", v15, v11, v8, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu Timeline Entries Generated widget size %@ {%.2f, %.2f}"), objc_msgSend(v16, "count"), v6, *(_QWORD *)&v8, *(_QWORD *)&v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@\n"), v17);
    v19 = objc_alloc(MEMORY[0x1E0C99E08]);
    v31 = CFSTR("Summary");
    v32[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithDictionary:", v20);

    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __72__PXTimelineDiagnosticAgent_timelineDiagnosticForWidgetSize_jsonFormat___block_invoke;
    v27[3] = &unk_1E511F000;
    v30 = v4;
    v22 = v21;
    v28 = v22;
    v23 = v18;
    v29 = v23;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v27);
    if (v4)
    {
      objc_msgSend(a1, "jsonStringFromObject:", v22);
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = v23;
    }
    v25 = v24;

  }
  else
  {
    objc_msgSend(a1, "errorMessage:jsonFormat:", CFSTR("No timeline entries generated."), v4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_19:
  return v25;
}

+ (id)timelineDiagnosticForAlbum:(id)a3 widgetSize:(id)a4 jsonFormat:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  BOOL v41;
  const __CFString *v42;
  void *v43;
  _QWORD v44[3];

  v5 = a5;
  v44[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqualToString:", CFSTR("favorites"));
  v12 = (void *)MEMORY[0x1E0CD13B8];
  if (v11)
  {
    objc_msgSend(v10, "librarySpecificFetchOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fetchAssetCollectionsWithType:subtype:options:", 2, 203, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD13B8], "localIdentifierWithUUID:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CD13B8];
    v44[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "librarySpecificFetchOptions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fetchAssetCollectionsWithLocalIdentifiers:options:", v18, v19);
    v20 = a1;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    a1 = v20;
  }
  objc_msgSend(v15, "localIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = *MEMORY[0x1E0C9D820];
    v24 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    +[PXWidgetTimeline timelineFromLibrary:albumIdentifier:widgetIdentifier:widgetSize:](PXWidgetTimeline, "timelineFromLibrary:albumIdentifier:widgetIdentifier:widgetSize:", v10, v22, 0, *MEMORY[0x1E0C9D820], v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "count"))
    {
      v36 = a1;
      v37 = v9;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu Timeline Entries Generated widget size %@ {%.2f, %.2f}"), objc_msgSend(v25, "count"), v9, v23, *(_QWORD *)&v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@\n"), v26);
      v28 = objc_alloc(MEMORY[0x1E0C99E08]);
      v42 = CFSTR("Summary");
      v43 = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v28, "initWithDictionary:", v29);

      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __78__PXTimelineDiagnosticAgent_timelineDiagnosticForAlbum_widgetSize_jsonFormat___block_invoke;
      v38[3] = &unk_1E511F000;
      v41 = v5;
      v31 = v30;
      v39 = v31;
      v32 = v27;
      v40 = v32;
      objc_msgSend(v25, "enumerateObjectsUsingBlock:", v38);
      if (v5)
      {
        objc_msgSend(v36, "jsonStringFromObject:", v31);
        v33 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v33 = v32;
      }
      v34 = v33;

      v9 = v37;
    }
    else
    {
      objc_msgSend(a1, "errorMessage:jsonFormat:", CFSTR("No timeline entries generated."), v5);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(a1, "errorMessage:jsonFormat:", CFSTR("No album found."), v5);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v34;
}

+ (id)errorMessage:(id)a3 jsonFormat:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v4 = a4;
  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    v8 = v6;
  }
  else
  {
    v11 = CFSTR("Error");
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "jsonStringFromObject:", v9);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

+ (id)jsonStringFromObject:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v9;

  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a3, 3, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v4)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[PXTimelineDiagnosticAgent] Error serializing json. Error: %@"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "errorMessage:jsonFormat:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

void __78__PXTimelineDiagnosticAgent_timelineDiagnosticForAlbum_widgetSize_jsonFormat___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a2;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("TimelineEntry[%lu]"), a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);
    v6 = (id)v7;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("%@ %@\n"), v8, v6);
  }

}

void __72__PXTimelineDiagnosticAgent_timelineDiagnosticForWidgetSize_jsonFormat___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a2;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("TimelineEntry[%lu]"), a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);
    v6 = (id)v7;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("%@ %@\n"), v8, v6);
  }

}

@end
