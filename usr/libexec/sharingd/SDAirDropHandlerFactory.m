@implementation SDAirDropHandlerFactory

+ (id)handlerForTransfer:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _QWORD v54[2];
  _QWORD v55[17];
  _QWORD v56[13];

  v3 = a3;
  v56[0] = objc_opt_class(SDAirDropHandlerCalendarEvents, v4);
  v56[1] = objc_opt_class(SDAirDropHandlerContacts, v5);
  v56[2] = objc_opt_class(SDAirDropHandlerNotes, v6);
  v56[3] = objc_opt_class(SDAirDropHandlerPhotos, v7);
  v56[4] = objc_opt_class(SDAirDropHandlerProfiles, v8);
  v56[5] = objc_opt_class(SDAirDropHandlerVoiceMails, v9);
  v56[6] = objc_opt_class(SDAirDropHandlerVoiceMemos, v10);
  v56[7] = objc_opt_class(SDAirDropHandlerWalletItems, v11);
  v56[8] = objc_opt_class(SDAirDropHandlerPDFs, v12);
  v56[9] = objc_opt_class(SDAirDropHandleriBooksItems, v13);
  v56[10] = objc_opt_class(_TtC16DaemoniOSLibrary19SDAirDropHandlerIPA, v14);
  v56[11] = objc_opt_class(SDAirDropHandlerPlaygroundItems, v15);
  v56[12] = objc_opt_class(SDAirDropHandlerGenericFiles, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v56, 13));
  v55[0] = objc_opt_class(SDAirDropHandlerCredentialLinks, v18);
  v55[1] = objc_opt_class(SDAirDropHandlerSharediCloudDocumentsLinks, v19);
  v55[2] = objc_opt_class(SDAirDropHandlerKeynoteLiveLinks, v20);
  v55[3] = objc_opt_class(SDAirDropHandlerFindMyFriendsLinks, v21);
  v55[4] = objc_opt_class(SDAirDropHandleriWorkLinks, v22);
  v55[5] = objc_opt_class(SDAirDropHandlerAppStoreLinks, v23);
  v55[6] = objc_opt_class(SDAirDropHandlerPhoneLinks, v24);
  v55[7] = objc_opt_class(SDAirDropHandleriBooksLinks, v25);
  v55[8] = objc_opt_class(SDAirDropHandlerPodcastsLinks, v26);
  v55[9] = objc_opt_class(SDAirDropHandleriTunesULinks, v27);
  v55[10] = objc_opt_class(SDAirDropHandleriTunesStoreLinks, v28);
  v55[11] = objc_opt_class(SDAirDropHandleriLifeLinks, v29);
  v55[12] = objc_opt_class(SDAirDropHandlerMapsLinks, v30);
  v55[13] = objc_opt_class(SDAirDropHandlerNewsLinks, v31);
  v55[14] = objc_opt_class(SDAirDropHandleriCloudFamilyLinks, v32);
  v55[15] = objc_opt_class(SDAirDropHandlerGenericLinks, v33);
  v55[16] = objc_opt_class(SDAirDropHandlerWebLinks, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v55, 17));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v35));

  v54[0] = objc_opt_class(SDAirDropHandlerMixedTypes, v37);
  v54[1] = objc_opt_class(SDAirDropHandlerUnsupportedType, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v54, 2));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "arrayByAddingObjectsFromArray:", v39));

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v41 = v40;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v50;
LABEL_3:
    v45 = 0;
    while (1)
    {
      if (*(_QWORD *)v50 != v44)
        objc_enumerationMutation(v41);
      v46 = objc_alloc(*(Class *)(*((_QWORD *)&v49 + 1) + 8 * v45));
      v47 = objc_msgSend(v46, "initWithTransfer:", v3, (_QWORD)v49);
      if ((objc_msgSend(v47, "canHandleTransfer") & 1) != 0)
        break;

      if (v43 == (id)++v45)
      {
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
        if (v43)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v47 = 0;
  }

  return v47;
}

@end
