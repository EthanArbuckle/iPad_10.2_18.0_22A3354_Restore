@implementation ICFixAttachmentMediaInconsistencyLaunchTask

- (ICFixAttachmentMediaInconsistencyLaunchTask)init
{
  ICFixAttachmentMediaInconsistencyLaunchTask *v2;
  NSSet *v3;
  NSSet *recordIDsProcessed;
  NSSet *v5;
  NSSet *recordIDsMarkedForDeletion;
  NSSet *v7;
  NSSet *recordIDsUnmarkedForDeletion;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICFixAttachmentMediaInconsistencyLaunchTask;
  v2 = -[ICFixAttachmentMediaInconsistencyLaunchTask init](&v10, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSSet);
    recordIDsProcessed = v2->_recordIDsProcessed;
    v2->_recordIDsProcessed = v3;

    v5 = objc_opt_new(NSSet);
    recordIDsMarkedForDeletion = v2->_recordIDsMarkedForDeletion;
    v2->_recordIDsMarkedForDeletion = v5;

    v7 = objc_opt_new(NSSet);
    recordIDsUnmarkedForDeletion = v2->_recordIDsUnmarkedForDeletion;
    v2->_recordIDsUnmarkedForDeletion = v7;

  }
  return v2;
}

- (void)runLaunchTask
{
  id v3;
  _QWORD v4[4];
  id v5;
  ICFixAttachmentMediaInconsistencyLaunchTask *v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000CEF34;
  v4[3] = &unk_10054FE80;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICWorkerContextLaunchTask workerContext](self, "workerContext"));
  v6 = self;
  v3 = v5;
  objc_msgSend(v3, "performBlockAndWait:", v4);

}

- (void)resolveInconsistencies:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  uint64_t v27;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  unsigned int v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  ICFixAttachmentMediaInconsistencyLaunchTask *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];

  v6 = a3;
  v37 = self;
  v38 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICFixAttachmentMediaInconsistencyLaunchTask recordIDsProcessed](self, "recordIDsProcessed"));
  v8 = objc_msgSend(v7, "mutableCopy");
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v11 = v10;

  v12 = ICKeyPathFromSelector("objectID");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKey:", v13));
  objc_msgSend(v11, "addObjectsFromArray:", v14);

  v15 = objc_msgSend(v11, "copy");
  -[ICFixAttachmentMediaInconsistencyLaunchTask setRecordIDsProcessed:](self, "setRecordIDsProcessed:", v15);

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v16 = v6;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v40 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
        v22 = objc_opt_class(ICAttachment);
        v23 = ICDynamicCast(v22, v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        if ((objc_msgSend(v21, "isUnsupported") & 1) == 0
          && (objc_msgSend(v21, "needsInitialFetchFromCloudCheckingParent") & 1) == 0)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "media"));
          v26 = objc_msgSend(v25, "needsInitialFetchFromCloud");

          if ((v26 & 1) == 0)
          {
            if (!v24
              || objc_msgSend(v24, "attachmentType")
              && ((v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "parentAttachment"))) == 0
               || (v28 = (void *)v27,
                   v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "parentAttachment")),
                   v30 = objc_msgSend(v29, "attachmentType"),
                   v29,
                   v28,
                   v30)))
            {
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "note"));
              v32 = objc_msgSend(v31, "markedForDeletion");

              if (v32)
              {
                v33 = os_log_create("com.apple.notes", "LaunchTask");
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
                {
                  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "note"));
                  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "ic_loggingIdentifier"));
                  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "ic_loggingIdentifier"));
                  *(_DWORD *)buf = 138412546;
                  v44 = v34;
                  v45 = 2112;
                  v46 = v35;
                  _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "Note (%@) containing attachment (%@) is marked for deletion", buf, 0x16u);

                }
                -[ICFixAttachmentMediaInconsistencyLaunchTask resolveViaDeletionWithAttachment:context:](v37, "resolveViaDeletionWithAttachment:context:", v21, v38);
              }
              else
              {
                -[ICFixAttachmentMediaInconsistencyLaunchTask resolveByConsultingNoteBodyForAttachment:context:](v37, "resolveByConsultingNoteBodyForAttachment:context:", v21, v38);
              }
            }
          }
        }

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v18);
  }

  objc_msgSend(v38, "ic_save");
}

- (void)resolveByConsultingNoteBodyForAttachment:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  BOOL v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void **v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "note"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "document"));
  if (v9 && (objc_msgSend(v8, "isPasswordProtectedAndLocked") & 1) == 0)
  {
    v10 = objc_msgSend(v8, "mergeUnappliedEncryptedRecord");

    if ((v10 & 1) != 0)
    {
      v25 = 0;
      v26 = &v25;
      v27 = 0x2020000000;
      v28 = 0;
      v19 = _NSConcreteStackBlock;
      v20 = 3221225472;
      v21 = sub_1000CF780;
      v22 = &unk_100554328;
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootParentAttachment"));
      v23 = v11;
      v24 = &v25;
      objc_msgSend(v8, "enumerateAbstractAttachmentsInOrderUsingBlock:", &v19);
      v12 = *((_BYTE *)v26 + 24) == 0;
      v13 = os_log_create("com.apple.notes", "LaunchTask");
      v14 = v13;
      if (v12)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ic_loggingIdentifier", v19, v20, v21, v22));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ic_loggingIdentifier"));
          *(_DWORD *)buf = 138412546;
          v30 = v17;
          v31 = 2112;
          v32 = v18;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Root attachment (%@) not found in note (%@) body", buf, 0x16u);

        }
        -[ICFixAttachmentMediaInconsistencyLaunchTask resolveViaDeletionWithAttachment:context:](self, "resolveViaDeletionWithAttachment:context:", v6, v7);
      }
      else
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ic_loggingIdentifier", v19, v20, v21, v22));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ic_loggingIdentifier"));
          sub_10040ACEC(v15, v16, (uint64_t)buf, v14);
        }

        -[ICFixAttachmentMediaInconsistencyLaunchTask resolveViaResurrectionWithAttachment:context:](self, "resolveViaResurrectionWithAttachment:context:", v6, v7);
      }

      _Block_object_dispose(&v25, 8);
    }
  }
  else
  {

  }
}

- (void)resolveViaResurrectionWithAttachment:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICFixAttachmentMediaInconsistencyLaunchTask recordIDsUnmarkedForDeletion](self, "recordIDsUnmarkedForDeletion"));
  v7 = objc_msgSend(v6, "mutableCopy");
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v10 = v9;

  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_1000CF898;
  v16 = &unk_100554350;
  v17 = v10;
  v18 = v5;
  v11 = v5;
  v12 = v10;
  -[ICFixAttachmentMediaInconsistencyLaunchTask enumerateObjectsThatShouldBeConsistentForAttachment:withBlock:](self, "enumerateObjectsThatShouldBeConsistentForAttachment:withBlock:", v11, &v13);
  -[ICFixAttachmentMediaInconsistencyLaunchTask setRecordIDsUnmarkedForDeletion:](self, "setRecordIDsUnmarkedForDeletion:", v12, v13, v14, v15, v16);

}

- (void)resolveViaDeletionWithAttachment:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSMutableSet *v9;
  NSMutableSet *v10;
  id v11;
  NSMutableSet *v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  NSMutableSet *v17;
  id v18;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICFixAttachmentMediaInconsistencyLaunchTask recordIDsMarkedForDeletion](self, "recordIDsMarkedForDeletion"));
  v7 = objc_msgSend(v6, "mutableCopy");
  v8 = v7;
  if (v7)
    v9 = (NSMutableSet *)v7;
  else
    v9 = objc_opt_new(NSMutableSet);
  v10 = v9;

  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_1000CFA90;
  v16 = &unk_100554350;
  v17 = v10;
  v18 = v5;
  v11 = v5;
  v12 = v10;
  -[ICFixAttachmentMediaInconsistencyLaunchTask enumerateObjectsThatShouldBeConsistentForAttachment:withBlock:](self, "enumerateObjectsThatShouldBeConsistentForAttachment:withBlock:", v11, &v13);
  -[ICFixAttachmentMediaInconsistencyLaunchTask setRecordIDsMarkedForDeletion:](self, "setRecordIDsMarkedForDeletion:", v12, v13, v14, v15, v16);

}

- (void)enumerateObjectsThatShouldBeConsistentForAttachment:(id)a3 withBlock:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = objc_opt_class(ICAttachment);
  v8 = ICDynamicCast(v7, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "parentAttachment"));
  if (v10)
  {
    v11 = (void *)v10;
    do
    {
      v6[2](v6, v11);
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "parentAttachment"));

      v11 = (void *)v12;
    }
    while (v12);
  }
  v6[2](v6, v5);
  if (v9)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "media"));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "media"));
      v6[2](v6, v14);
    }
    else
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subAttachments"));
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v29;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v29 != v17)
              objc_enumerationMutation(v14);
            v6[2](v6, *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v18));
            v18 = (char *)v18 + 1;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v16);
      }
    }

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "inlineAttachments", 0));
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v25;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v25 != v22)
            objc_enumerationMutation(v19);
          v6[2](v6, *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v23));
          v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v21);
    }

  }
}

- (NSSet)recordIDsProcessed
{
  return self->_recordIDsProcessed;
}

- (void)setRecordIDsProcessed:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsProcessed, a3);
}

- (NSSet)recordIDsMarkedForDeletion
{
  return self->_recordIDsMarkedForDeletion;
}

- (void)setRecordIDsMarkedForDeletion:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsMarkedForDeletion, a3);
}

- (NSSet)recordIDsUnmarkedForDeletion
{
  return self->_recordIDsUnmarkedForDeletion;
}

- (void)setRecordIDsUnmarkedForDeletion:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsUnmarkedForDeletion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDsUnmarkedForDeletion, 0);
  objc_storeStrong((id *)&self->_recordIDsMarkedForDeletion, 0);
  objc_storeStrong((id *)&self->_recordIDsProcessed, 0);
}

@end
