@implementation NCNotificationRequest

void __141__NCNotificationRequest_Bulletin___notificationRequestForBulletin_observer_sectionInfo_feed_playLightsAndSirens_hasPlayLightsAndSirens_uuid___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  id v9;
  void (**v10)(void *, void *);
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD aBlock[7];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _QWORD v40[4];

  v40[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  _iconImagesForBulletinAndSectionInfo(*(void **)(a1 + 32), *(void **)(a1 + 40), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v7, "addObjectsFromArray:", v8);
  if (objc_msgSend(*(id *)(a1 + 32), "hasSubordinateIcon"))
  {
    v9 = *(id *)(a1 + 40);
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__9;
    v38 = __Block_byref_object_dispose__9;
    v39 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__9;
    v32 = __Block_byref_object_dispose__9;
    v33 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = ___iconImagesForSectionInfo_block_invoke;
    aBlock[3] = &unk_1E8D1DD78;
    aBlock[5] = &v28;
    aBlock[6] = a4;
    aBlock[4] = &v34;
    v10 = (void (**)(void *, void *))_Block_copy(aBlock);
    objc_msgSend(v9, "sectionID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = _sectionIdentifierIconDenyListContains(v11);

    if ((v12 & 1) != 0)
    {
      v13 = 0;
    }
    else
    {
      objc_msgSend(v9, "icon");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10[2](v10, v13);
    if ((v12 & 1) == 0)

    objc_msgSend(v9, "sectionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_sectionIdentifierIconDenyListContains(v14) & 1) != 0)
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(v9, "sectionID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (!v35[5])
    {
      NCIconImageForApplicationIdentifierWithFormat(v15, a4, 1);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v35[5];
      v35[5] = v16;

    }
    if (!v29[5])
    {
      NCIconImageForApplicationIdentifierWithFormat(v15, a4, 2);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v29[5];
      v29[5] = v18;

    }
    v20 = (void *)v35[5];
    if (v20)
      v21 = 0;
    else
      v21 = v12;
    if (v21 == 1)
    {
      objc_msgSend(v9, "icon");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, v22);

      v20 = (void *)v35[5];
    }
    v23 = v20;
    if (!v20)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v40[0] = v23;
    v24 = (void *)v29[5];
    v25 = v24;
    if (!v24)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v40[1] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)

    if (!v20)
    _Block_object_dispose(&v28, 8);

    _Block_object_dispose(&v34, 8);
    if (v26)
      objc_msgSend(v7, "addObjectsFromArray:", v26);

  }
}

void __59__NCNotificationRequest_NCUIAdditions__requesterIdentifier__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)requesterIdentifier___requesterIdentifier_0;
  requesterIdentifier___requesterIdentifier_0 = v0;

}

@end
