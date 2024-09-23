@implementation UGCPhotosForm

+ (id)editPhotosFormWithPlaceQuestionnaire:(id)a3 previouslySubmittedImages:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  UGCDownloadablePhoto *v15;
  UGCDownloadablePhoto *v16;
  id UInteger;
  UGCPhotosForm *v18;
  id v19;
  UGCPhotosForm *v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v8 = objc_alloc_init((Class)NSMutableArray);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v13);
          v15 = [UGCDownloadablePhoto alloc];
          v16 = -[UGCDownloadablePhoto initWithGEORPEnrichmentImage:](v15, "initWithGEORPEnrichmentImage:", v14, (_QWORD)v23);
          objc_msgSend(v8, "addObject:", v16);

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v11);
    }

    if (MapsFeature_IsEnabled_SydneyARP())
      UInteger = objc_msgSend(v6, "maximumNumberOfPhotos");
    else
      UInteger = (id)GEOConfigGetUInteger(MapsConfig_UGCMaximumOfContributedPhotosPerPOI, off_1014B37A8);
    v19 = UInteger;
    v20 = [UGCPhotosForm alloc];
    v21 = objc_msgSend(v8, "copy");
    v18 = -[UGCPhotosForm initWithActionType:initialPhotos:maximumNumberOfPhotos:](v20, "initWithActionType:initialPhotos:maximumNumberOfPhotos:", 1, v21, v19);

  }
  else
  {
    v18 = (UGCPhotosForm *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "addPhotosFormWithPlaceQuestionnaire:photosWithMetadata:", v6, &__NSArray0__struct));
  }

  return v18;
}

+ (id)addPhotosFormWithPlaceQuestionnaire:(id)a3 photosWithMetadata:(id)a4
{
  id v5;
  id v6;
  id UInteger;
  UGCPhotosForm *v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "canCollectPhotos"))
  {
    if (MapsFeature_IsEnabled_SydneyARP())
      UInteger = objc_msgSend(v5, "maximumNumberOfPhotos");
    else
      UInteger = (id)GEOConfigGetUInteger(MapsConfig_UGCMaximumOfContributedPhotosPerPOI, off_1014B37A8);
    v8 = -[UGCPhotosForm initWithActionType:initialPhotos:maximumNumberOfPhotos:]([UGCPhotosForm alloc], "initWithActionType:initialPhotos:maximumNumberOfPhotos:", 0, &__NSArray0__struct, UInteger);
    -[UGCPhotosForm addPhotoListWithMetadata:](v8, "addPhotoListWithMetadata:", v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (UGCPhotosForm)initWithActionType:(int64_t)a3 initialPhotos:(id)a4 maximumNumberOfPhotos:(unint64_t)a5
{
  id v8;
  UGCPhotosForm *v9;
  UGCPhotosForm *v10;
  NSMutableArray *v11;
  NSMutableArray *activePhotoList;
  NSMutableArray *v13;
  NSMutableArray *removedExistingPhotos;
  objc_super v16;

  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)UGCPhotosForm;
  v9 = -[UGCForm init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    v9->_actionType = a3;
    v11 = (NSMutableArray *)objc_msgSend(v8, "mutableCopy");
    activePhotoList = v10->_activePhotoList;
    v10->_activePhotoList = v11;

    v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    removedExistingPhotos = v10->_removedExistingPhotos;
    v10->_removedExistingPhotos = v13;

    v10->_maximumNumberOfPhotos = a5;
  }

  return v10;
}

- (void)addPhoto:(id)a3
{
  id v4;
  uint8_t v5[16];

  v4 = a3;
  if (sub_10038D8B0(self))
  {
    if (-[UGCPhotosForm _addPhoto:](self, "_addPhoto:", v4))
      -[UGCForm _notifyObserversOfChange](self, "_notifyObserversOfChange");
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: numberOfPhotoSlotsAvailableForForm(self) > 0", v5, 2u);
  }

}

- (void)addPhotoListWithMetadata:(id)a3
{
  id v4;
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v4);
        v7 |= -[UGCPhotosForm _addPhoto:](self, "_addPhoto:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
    if ((v7 & 1) != 0)
      -[UGCForm _notifyObserversOfChange](self, "_notifyObserversOfChange");
  }

}

- (BOOL)_addPhoto:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;

  v4 = a3;
  if ((-[NSMutableArray containsObject:](self->_activePhotoList, "containsObject:", v4) & 1) != 0
    || MapsFeature_IsEnabled_SydneyARP()
    && (v5 = -[UGCPhotosForm numberOfAddedPhotos](self, "numberOfAddedPhotos"),
        v5 >= -[UGCPhotosForm maximumNumberOfPhotos](self, "maximumNumberOfPhotos")))
  {
    v6 = 0;
  }
  else
  {
    -[NSMutableArray addObject:](self->_activePhotoList, "addObject:", v4);
    v6 = 1;
  }

  return v6;
}

- (BOOL)removePhotoWithIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableArray *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  char *v15;
  uint64_t v17;
  UGCPhotosForm *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = 24;
  v6 = self->_activePhotoList;
  v7 = (char *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v17 = 24;
    v18 = self;
    v8 = 0;
    v9 = *(_QWORD *)v20;
    while (2)
    {
      v10 = 0;
      v11 = &v8[(_QWORD)v7];
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier", v17, v18, (_QWORD)v19));
        v14 = objc_msgSend(v13, "isEqualToString:", v4);

        if (v14)
        {
          v7 = v12;
          v11 = &v10[(_QWORD)v8];
          goto LABEL_11;
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = (char *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v8 = v11;
      if (v7)
        continue;
      break;
    }
LABEL_11:
    v5 = v17;
    self = v18;
  }
  else
  {
    v11 = 0;
  }

  v15 = (char *)objc_msgSend(*(id *)((char *)&self->super.super.isa + v5), "count");
  if (v11 < v15)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v5), "removeObjectAtIndex:", v11);
    if (v7 && objc_msgSend(v7, "needsToBeDownloaded"))
      -[NSMutableArray addObject:](self->_removedExistingPhotos, "addObject:", v7);
    -[UGCForm _notifyObserversOfChange](self, "_notifyObserversOfChange");
  }

  return v11 < v15;
}

- (NSArray)activePhotoList
{
  return (NSArray *)-[NSMutableArray copy](self->_activePhotoList, "copy");
}

- (NSArray)addedPhotosWithMetadata
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosForm activePhotoList](self, "activePhotoList", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "needsToBeDownloaded") & 1) == 0)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = objc_msgSend(v3, "copy");
  return (NSArray *)v10;
}

- (int64_t)indexOfPhotoWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosForm activePhotoList](self, "activePhotoList"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    while (1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosForm activePhotoList](self, "activePhotoList"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v7));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
      v11 = objc_msgSend(v10, "isEqualToString:", v4);

      if ((v11 & 1) != 0)
        break;
      ++v7;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosForm activePhotoList](self, "activePhotoList"));
      v13 = objc_msgSend(v12, "count");

      if (v7 >= (unint64_t)v13)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (NSArray)currentExistingPhotos
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosForm activePhotoList](self, "activePhotoList", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "needsToBeDownloaded"))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = objc_msgSend(v3, "copy");
  return (NSArray *)v10;
}

- (NSArray)removedExistingPhotos
{
  return (NSArray *)-[NSMutableArray copy](self->_removedExistingPhotos, "copy");
}

- (unint64_t)numberOfAddedPhotos
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosForm addedPhotosWithMetadata](self, "addedPhotosWithMetadata"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (id)addedPhotos
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosForm addedPhotosWithMetadata](self, "addedPhotosWithMetadata"));
  v3 = objc_msgSend(v2, "copy");

  return v3;
}

- (BOOL)isComplete
{
  unint64_t actionType;

  if (!-[UGCPhotosForm passesMinimumRequirementsToBeSubmittable](self, "passesMinimumRequirementsToBeSubmittable"))
    return 0;
  actionType = self->_actionType;
  if (actionType < 2)
    return -[UGCPhotosForm _isCompleteForAddOrEdit](self, "_isCompleteForAddOrEdit");
  if (actionType == 2)
    return -[UGCPhotosForm _isCompleteForDelete](self, "_isCompleteForDelete");
  else
    return 0;
}

- (BOOL)passesMinimumRequirementsToBeSubmittable
{
  return 1;
}

- (BOOL)_isCompleteForDelete
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosForm activePhotoList](self, "activePhotoList"));
  if (objc_msgSend(v3, "count"))
    v4 = 0;
  else
    v4 = -[UGCPhotosForm isEdited](self, "isEdited");

  return v4;
}

- (BOOL)isEmpty
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosForm activePhotoList](self, "activePhotoList"));
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (BOOL)isEdited
{
  void *v3;
  BOOL v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosForm removedExistingPhotos](self, "removedExistingPhotos"));
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosForm addedPhotosWithMetadata](self, "addedPhotosWithMetadata"));
    v4 = objc_msgSend(v5, "count") != 0;

  }
  return v4;
}

- (void)fillSubmissionFields:(id)a3
{
  id v4;
  unint64_t actionType;
  id v6;

  v4 = a3;
  actionType = self->_actionType;
  if (actionType < 2)
  {
    v6 = v4;
    -[UGCPhotosForm _fillSubmissionFieldsForAddOrEdit:](self, "_fillSubmissionFieldsForAddOrEdit:", v4);
LABEL_5:
    v4 = v6;
    goto LABEL_6;
  }
  if (actionType == 2)
  {
    v6 = v4;
    -[UGCPhotosForm _fillSubmissionFieldsForDelete:](self, "_fillSubmissionFieldsForDelete:", v4);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_fillSubmissionFieldsForAddOrEdit:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];

  v4 = a3;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosForm addedPhotosWithMetadata](self, "addedPhotosWithMetadata"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "addPhoto:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v7);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "poiEnrichment"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosForm currentExistingPhotos](self, "currentExistingPhotos"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v30;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v15), "identifier"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[GEORPImageUpdate unmodifiedImageUpdateWithImageId:](GEORPImageUpdate, "unmodifiedImageUpdateWithImageId:", v16));

        objc_msgSend(v10, "addImageUpdate:", v17);
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v13);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosForm removedExistingPhotos](self, "removedExistingPhotos", 0));
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v22), "identifier"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[GEORPImageUpdate deleteImageUpdateWithImageId:](GEORPImageUpdate, "deleteImageUpdateWithImageId:", v23));

        objc_msgSend(v10, "addImageUpdate:", v24);
        v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v20);
  }

}

- (void)_fillSubmissionFieldsForDelete:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "poiEnrichment"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosForm currentExistingPhotos](self, "currentExistingPhotos"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v9), "identifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[GEORPImageUpdate deleteImageUpdateWithImageId:](GEORPImageUpdate, "deleteImageUpdateWithImageId:", v10));

        objc_msgSend(v4, "addImageUpdate:", v11);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotosForm removedExistingPhotos](self, "removedExistingPhotos", 0));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v16), "identifier"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[GEORPImageUpdate deleteImageUpdateWithImageId:](GEORPImageUpdate, "deleteImageUpdateWithImageId:", v17));

        objc_msgSend(v4, "addImageUpdate:", v18);
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

}

- (unint64_t)maximumNumberOfPhotosPerSubmission
{
  if (MapsFeature_IsEnabled_SydneyARP(self, a2))
    return -[UGCPhotosForm maximumNumberOfPhotos](self, "maximumNumberOfPhotos");
  else
    return GEOConfigGetUInteger(MapsConfig_UGCMaximumOfAddedPhotosPerSubmission, off_1014B37B8);
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (id)parentSubmissionIdentifier
{
  return self->_parentSubmissionIdentifier;
}

- (void)setParentSubmissionIdentifier:(id)a3
{
  self->_parentSubmissionIdentifier = (NSString *)a3;
}

- (unint64_t)maximumNumberOfPhotos
{
  return self->_maximumNumberOfPhotos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedExistingPhotos, 0);
  objc_storeStrong((id *)&self->_activePhotoList, 0);
}

@end
