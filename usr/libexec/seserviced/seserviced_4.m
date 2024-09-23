uint64_t sub_1002661C8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  _BYTE v35[128];

  if (!a1)
    return 0;
  if (!*(_QWORD *)(a1 + 40))
  {
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 192), "UUIDString")));
    v13 = objc_msgSend(v12, "UTF8String");
    KmlSharingLogFunc(OS_LOG_TYPE_INFO, (uint64_t)"KmlOwnerSharingManager.m", 1451, (uint64_t)v13, CFSTR("Failed to retrieve saved authorizationId"), v14, v15, v16, v29);

    return 0;
  }
  v34 = 0;
  v2 = SESEndPointListAuthorizations(&v34);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = v34;
  if (v4)
  {
    v5 = *(id *)(a1 + 192);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString")));
    v7 = objc_msgSend(v6, "UTF8String");
    KmlSharingLogFunc(OS_LOG_TYPE_INFO, (uint64_t)"KmlOwnerSharingManager.m", 1458, (uint64_t)v7, CFSTR("Error in getting saved authorizations : %@"), v8, v9, v10, (uint64_t)v4);
    v11 = 0;
  }
  else
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v17 = v3;
    v11 = (uint64_t)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v11)
    {
      v18 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v31 != v18)
            objc_enumerationMutation(v17);
          v20 = *(void **)(a1 + 40);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "authorizationID"));
          LOBYTE(v20) = objc_msgSend(v20, "isEqualToData:", v21);

          if ((v20 & 1) != 0)
          {
            v11 = 1;
            goto LABEL_17;
          }
        }
        v11 = (uint64_t)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_17:

    v22 = *(id *)(a1 + 192);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "UUIDString")));
    v23 = objc_msgSend(v6, "UTF8String");
    v24 = kmlUtilHexStringFromData(*(void **)(a1 + 40));
    v5 = (id)objc_claimAutoreleasedReturnValue(v24);

    KmlSharingLogFunc(OS_LOG_TYPE_INFO, (uint64_t)"KmlOwnerSharingManager.m", 1470, (uint64_t)v23, CFSTR("Authorization with ID %@, found - %d"), v25, v26, v27, (uint64_t)v5);
  }

  return v11;
}

void sub_100266420(uint64_t a1, char a2, char a3)
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  if (a1)
  {
    v6 = sub_10023E06C((uint64_t)KmlSharingManager);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = sub_10023E788((uint64_t)v7, a2, a3, *(void **)(a1 + 24));
    v15 = (id)objc_claimAutoreleasedReturnValue(v8);

    if (v15)
    {
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 192), "UUIDString")));
      v10 = objc_msgSend(v9, "UTF8String");
      KmlSharingLogFunc(OS_LOG_TYPE_INFO, (uint64_t)"KmlOwnerSharingManager.m", 1392, (uint64_t)v10, CFSTR("Could not update endpoint"), v11, v12, v13, v14);

    }
  }
}

void sub_1002664D4(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a1)
  {
    v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 192), "UUIDString")));
    v3 = objc_msgSend(v2, "UTF8String");
    KmlSharingLogFunc(OS_LOG_TYPE_INFO, (uint64_t)"KmlOwnerSharingManager.m", 1375, (uint64_t)v3, CFSTR("Resetting state"), v4, v5, v6, v7);

    *(_QWORD *)(a1 + 8) = 0;
    *(_BYTE *)(a1 + 168) = 1;
    sub_100261820(a1, 1);
  }
}

void sub_100266628(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 224);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v6);
      v8 = sub_10020CAB4((uint64_t)v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 40));

      if ((v10 & 1) != 0)
        break;
      if (v4 == (id)++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v11 = v7;

    if (!v11)
      goto LABEL_12;
    sub_10020D230((uint64_t)v11, *(void **)(*(_QWORD *)(a1 + 32) + 136));
    sub_10024EF50(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));
  }
  else
  {
LABEL_9:

LABEL_12:
    v12 = *(_QWORD **)(a1 + 32);
    if (v12)
      v12 = (_QWORD *)v12[24];
    v13 = v12;
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString")));
    v14 = objc_msgSend(v11, "UTF8String");
    KmlSharingLogFunc(OS_LOG_TYPE_INFO, (uint64_t)"KmlOwnerSharingManager.m", 1585, (uint64_t)v14, CFSTR("We don't have an active sharing session with invitation id %@"), v15, v16, v17, *(_QWORD *)(a1 + 40));

  }
}

void sub_1002668AC(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 224);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v27;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v6);
      v8 = sub_10020CAB4((uint64_t)v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 40));

      if ((v10 & 1) != 0)
        break;
      if (v4 == (id)++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v11 = v7;

    if (!v11)
      goto LABEL_14;
    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      v13 = *(void **)(v12 + 192);
    else
      v13 = 0;
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString")));
    v15 = objc_msgSend(v14, "UTF8String");
    KmlSharingLogFunc(OS_LOG_TYPE_DEBUG, (uint64_t)"KmlOwnerSharingManager.m", 1615, (uint64_t)v15, CFSTR("Passcode retry requested from friend"), v16, v17, v18, v25);

    sub_10020D230((uint64_t)v11, *(void **)(*(_QWORD *)(a1 + 32) + 136));
    sub_10024EF50(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));
  }
  else
  {
LABEL_9:

LABEL_14:
    v19 = *(_QWORD **)(a1 + 32);
    if (v19)
      v19 = (_QWORD *)v19[24];
    v20 = v19;
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "UUIDString")));
    v21 = objc_msgSend(v11, "UTF8String");
    KmlSharingLogFunc(OS_LOG_TYPE_INFO, (uint64_t)"KmlOwnerSharingManager.m", 1611, (uint64_t)v21, CFSTR("We don't have an active sharing session with invitation id %@"), v22, v23, v24, *(_QWORD *)(a1 + 40));

  }
}

void sub_100266BD8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 176));
  objc_msgSend(WeakRetained, "handleOwnerKeySharingCancelStatus:", *(_QWORD *)(a1 + 40));

}

void sub_100266CD8(uint64_t a1)
{
  sub_100266CF0(*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(void **)(a1 + 48));
}

void sub_100266CF0(uint64_t a1, void *a2, int a3, int a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unsigned __int8 v19;
  id v20;
  unsigned int v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  int v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];

  v9 = a2;
  v10 = a5;
  if (!a1)
    goto LABEL_22;
  if (!v9)
  {
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 192), "UUIDString")));
    v38 = objc_msgSend(v33, "UTF8String");
    KmlSharingLogFunc(OS_LOG_TYPE_INFO, (uint64_t)"KmlOwnerSharingManager.m", 1659, (uint64_t)v38, CFSTR("Invitation ID is nil"), v39, v40, v41, v55);
LABEL_21:

    goto LABEL_22;
  }
  v57 = a4;
  v58 = a3;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v11 = *(id *)(a1 + 224);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
  if (!v12)
  {
LABEL_11:

LABEL_19:
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 192), "UUIDString")));
    v34 = objc_msgSend(v33, "UTF8String");
    KmlSharingLogFunc(OS_LOG_TYPE_INFO, (uint64_t)"KmlOwnerSharingManager.m", 1672, (uint64_t)v34, CFSTR("We don't have an active sharing session with invitation id %@"), v35, v36, v37, (uint64_t)v9);
    goto LABEL_21;
  }
  v13 = v12;
  v14 = *(_QWORD *)v60;
LABEL_5:
  v15 = 0;
  while (1)
  {
    if (*(_QWORD *)v60 != v14)
      objc_enumerationMutation(v11);
    v16 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v15);
    v17 = sub_10020CAB4((uint64_t)v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = objc_msgSend(v18, "isEqualToString:", v9);

    if ((v19 & 1) != 0)
      break;
    if (v13 == (id)++v15)
    {
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
      if (v13)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  v20 = v16;

  if (!v20)
    goto LABEL_19;
  if ((sub_10022DC4C(*(_QWORD *)(a1 + 144)) & 1) == 0)
  {
    v21 = sub_10020D458(v20);
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 192), "UUIDString")));
    v23 = objc_msgSend(v22, "UTF8String");
    KmlSharingLogFunc(OS_LOG_TYPE_INFO, (uint64_t)"KmlOwnerSharingManager.m", 1682, (uint64_t)v23, CFSTR("Free up slot identifier index %d"), v24, v25, v26, v21);

    *(_BYTE *)(a1 + 128) |= 1 << v21;
    sub_100266420(a1, 1 << v21, 0);
  }
  sub_10020D230((uint64_t)v20, *(void **)(a1 + 136));
  sub_10024EF50(*(_QWORD *)(a1 + 136));
  sub_10020D4B8((uint64_t)v20);
  objc_msgSend(*(id *)(a1 + 224), "removeObject:", v20);

  v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 192), "UUIDString")));
  v28 = objc_msgSend(v27, "UTF8String");
  if (v10)
  {
    KmlSharingLogFunc(OS_LOG_TYPE_ERROR, (uint64_t)"KmlOwnerSharingManager.m", 1695, (uint64_t)v28, CFSTR("Sharing invitation %@, failed with error %@"), v29, v30, v31, (uint64_t)v9);

    if (objc_msgSend(*(id *)(a1 + 224), "count"))
      goto LABEL_22;
    v32 = *(_QWORD *)(a1 + 8);
    if (v32 == 10)
    {
      sub_1002664D4(a1);
      goto LABEL_22;
    }
    if (v32 > 8)
    {
      if (v32 != 11)
        goto LABEL_33;
    }
    else if (*(_BYTE *)(a1 + 168))
    {
      goto LABEL_33;
    }
LABEL_32:
    sub_100265184(a1);
LABEL_33:
    v48 = a1;
    v49 = 14;
    goto LABEL_34;
  }
  KmlSharingLogFunc(OS_LOG_TYPE_INFO, (uint64_t)"KmlOwnerSharingManager.m", 1710, (uint64_t)v28, CFSTR("Shared key successfully"), v29, v30, v31, v55);

  *(_QWORD *)(a1 + 184) = sub_10024F79C(*(_QWORD *)(a1 + 136));
  if (!v57)
  {
    v42 = v58;
    if (objc_msgSend(*(id *)(a1 + 224), "count"))
    {
      v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 192), "UUIDString")));
      v44 = objc_msgSend(v43, "UTF8String");
      KmlSharingLogFunc(OS_LOG_TYPE_INFO, (uint64_t)"KmlOwnerSharingManager.m", 1726, (uint64_t)v44, CFSTR("BindingAttestation not used. No more sharing possible with this auth."), v45, v46, v47, v56);

      v48 = a1;
      v49 = 11;
LABEL_34:
      sub_100261820(v48, v49);
      goto LABEL_22;
    }
LABEL_30:
    v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 192), "UUIDString")));
    v51 = objc_msgSend(v50, "UTF8String");
    KmlSharingLogFunc(OS_LOG_TYPE_INFO, (uint64_t)"KmlOwnerSharingManager.m", 1719, (uint64_t)v51, CFSTR("All sessions completed"), v52, v53, v54, v56);

    if (v57 && !v42)
      goto LABEL_33;
    goto LABEL_32;
  }
  v42 = v58;
  if (!*(_BYTE *)(a1 + 168))
    sub_100261820(a1, 9);
  if (!objc_msgSend(*(id *)(a1 + 224), "count"))
    goto LABEL_30;
LABEL_22:

}

void sub_1002671C0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  unsigned __int8 v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(a1 + 56) != 8)
  {
    if (v2)
      v4 = *(void **)(v2 + 192);
    else
      v4 = 0;
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString")));
    v6 = objc_msgSend(v5, "UTF8String");
    v10 = CFSTR("We only handle re-invite request. Anything else we drop to floor");
    v11 = 1746;
    goto LABEL_16;
  }
  v3 = *(_QWORD *)(v2 + 8);
  if (v3 != 9)
  {
    if (!v3)
    {
      objc_storeStrong((id *)(v2 + 208), *(id *)(a1 + 40));
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = *(_QWORD *)(a1 + 64);
      sub_100261820(*(_QWORD *)(a1 + 32), 1);
LABEL_17:
      v27 = sub_1002342C4((uint64_t)KmlSharingTransport);
      v36 = (id)objc_claimAutoreleasedReturnValue(v27);
      sub_10023470C((uint64_t)v36, *(void **)(a1 + 40));

      return;
    }
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v2 + 192), "UUIDString")));
    v6 = objc_msgSend(v5, "UTF8String");
    v10 = CFSTR("We have never successfully shared with this friend. Can't re-share. Dropping the request");
    v11 = 1764;
LABEL_16:
    KmlSharingLogFunc(OS_LOG_TYPE_INFO, (uint64_t)"KmlOwnerSharingManager.m", v11, (uint64_t)v6, v10, v7, v8, v9, v34);

    goto LABEL_17;
  }
  v12 = objc_msgSend(*(id *)(v2 + 192), "isEqual:", *(_QWORD *)(a1 + 48));
  v13 = *(_QWORD *)(a1 + 32);
  if ((v12 & 1) == 0)
  {
    if (v13)
      v13 = *(_QWORD *)(v13 + 192);
    v28 = (id)v13;
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "UUIDString")));
    v30 = objc_msgSend(v29, "UTF8String");
    KmlSharingLogFunc(OS_LOG_TYPE_INFO, (uint64_t)"KmlOwnerSharingManager.m", 1770, (uint64_t)v30, CFSTR("We expect uuid to be : %@, instead got request with uuid : %@"), v31, v32, v33, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192));

    goto LABEL_17;
  }
  if (*(_QWORD *)(v13 + 216)
    && (objc_storeStrong((id *)(v13 + 208), *(id *)(a1 + 40)), (v13 = *(_QWORD *)(a1 + 32)) == 0))
  {
    v14 = 0;
  }
  else
  {
    v14 = *(void **)(v13 + 192);
  }
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString")));
  v16 = objc_msgSend(v15, "UTF8String");
  KmlSharingLogFunc(OS_LOG_TYPE_INFO, (uint64_t)"KmlOwnerSharingManager.m", 1781, (uint64_t)v16, CFSTR("We have at least one successful sharing with this friend and some in flight."), v17, v18, v19, v34);

  v20 = *(_QWORD *)(a1 + 32);
  if (v20)
    v21 = *(void **)(v20 + 192);
  else
    v21 = 0;
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "UUIDString")));
  v23 = objc_msgSend(v22, "UTF8String");
  KmlSharingLogFunc(OS_LOG_TYPE_INFO, (uint64_t)"KmlOwnerSharingManager.m", 1782, (uint64_t)v23, CFSTR("Cancel the ones that are in flight and reset the sharing manager to share again"), v24, v25, v26, v35);

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = *(_QWORD *)(a1 + 64);
  sub_100261820(*(_QWORD *)(a1 + 32), 10);
}

id *sub_100267524(id *result, void *a2)
{
  if (result)
    return (id *)objc_storeWeak(result + 22, a2);
  return result;
}

void sub_1002676FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id *v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession deleteKey:callback:]_block_invoke", 53, CFSTR("key to revoke: %@"), a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
  v9 = sub_100255B5C((id *)[KmlEndpointManager alloc], *(void **)(a1 + 32), 0);
  v13 = 0;
  v10 = sub_100255CA0((uint64_t)v9, &v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v13;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_100267860(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t *v9;
  void *v10;
  uint64_t *v11;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession localDeleteKey:callback:]_block_invoke", 64, CFSTR("key to delete: %@"), a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
  v11 = (uint64_t *)sub_100255B5C((id *)[KmlEndpointManager alloc], *(void **)(a1 + 32), 0);
  v9 = sub_10025620C(v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_100267A10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession remoteTerminateKeys:nodeGroupIdentifiers:treeGroupIdentifiers:adminKey:callback:]_block_invoke", 80, CFSTR("keys to delete: %@"), a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession remoteTerminateKeys:nodeGroupIdentifiers:treeGroupIdentifiers:adminKey:callback:]_block_invoke", 81, CFSTR("groupIdentifiers for nodes to delete: %@"), v9, v10, v11, v12, *(_QWORD *)(a1 + 40));
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession remoteTerminateKeys:nodeGroupIdentifiers:treeGroupIdentifiers:adminKey:callback:]_block_invoke", 82, CFSTR("groupIdentifiers for trees to delete: %@"), v13, v14, v15, v16, *(_QWORD *)(a1 + 48));
  v17 = sub_100255B5C((id *)[KmlEndpointManager alloc], *(void **)(a1 + 56), 0);
  v18 = *(void **)(a1 + 32);
  v19 = *(void **)(a1 + 40);
  v20 = *(void **)(a1 + 48);
  v34 = 0;
  v21 = sub_100258280((uint64_t)v17, v18, v19, v20, &v34);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = v34;
  if (v22)
  {
    v24 = objc_alloc((Class)DAAlishaKeyEncryptedRequest);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "version"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "ephemeralPublicKeydata"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "receiverPublicKeyHash"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "cipherText"));
    v29 = objc_msgSend(v24, "initWithVersion:ephemeralPublicKey:publicKeyHash:encryptedRequest:", v25, v26, v27, v28);

    KmlLogFunc_InternalOnly(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlKeyManagementSession remoteTerminateKeys:nodeGroupIdentifiers:treeGroupIdentifiers:adminKey:callback:]_block_invoke", 96, CFSTR("EncryptedRequest=%@"), v30, v31, v32, v33, (uint64_t)v29);
  }
  else
  {
    v29 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void sub_100267C84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id *v9;
  void **v10;
  void *v11;
  id v12;
  id v13;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession listSharingInvitationsForKeyIdentifier:callback:]_block_invoke", 106, CFSTR("Owner key identifier: %@"), a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
  v9 = sub_100255B5C((id *)[KmlEndpointManager alloc], *(void **)(a1 + 32), 0);
  v13 = 0;
  v10 = sub_100259028((uint64_t)v9, &v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v13;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_100267DC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9;
  id **v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id **v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession listReceivedSharingInvitationsWithCallback:]_block_invoke", 118, &stru_100316BD0, a5, a6, a7, a8, v20);
  v9 = sub_10023E06C((uint64_t)KmlSharingManager);
  v10 = (id **)objc_claimAutoreleasedReturnValue(v9);
  v21 = 0;
  v17 = sub_10023EFFC(v10, &v21, v11, v12, v13, v14, v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = v21;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_100267EEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession cancelAllFriendInvitationsWithCompletionHandler:]_block_invoke", 130, &stru_100316BD0, a5, a6, a7, a8, v19);
  v9 = sub_10023E06C((uint64_t)KmlSharingManager);
  v20 = (id)objc_claimAutoreleasedReturnValue(v9);
  v17 = sub_10023F21C((uint64_t)v20, v10, v11, v12, v13, v14, v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_10026801C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession removeSharingInvitationWithId:completionHandler:]_block_invoke", 142, &stru_100316BD0, a5, a6, a7, a8, v12);
  v9 = sub_10023E06C((uint64_t)KmlSharingManager);
  v13 = (id)objc_claimAutoreleasedReturnValue(v9);
  v10 = sub_10023F454((uint64_t)v13, *(void **)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_10026817C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession cancelInvitationsWithIdentifiers:sentByOwnerKeyWithIdentifier:callback:]_block_invoke", 156, CFSTR("Owner key ID: %@"), a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession cancelInvitationsWithIdentifiers:sentByOwnerKeyWithIdentifier:callback:]_block_invoke", 157, CFSTR("Invitations to cancel :%@"), v9, v10, v11, v12, *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v17 = *(id *)(a1 + 40);
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v40;
      while (2)
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v40 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
          v23 = sub_10025FA94((uint64_t)KmlOwnerSharingManager, *(void **)(a1 + 32), v22);
          v24 = objc_claimAutoreleasedReturnValue(v23);
          v25 = *(_QWORD *)(a1 + 48);
          v26 = *(void **)(v25 + 64);
          *(_QWORD *)(v25 + 64) = v24;

          if (*(_QWORD *)(*(_QWORD *)(a1 + 48) + 64))
          {
            KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession cancelInvitationsWithIdentifiers:sentByOwnerKeyWithIdentifier:callback:]_block_invoke", 168, CFSTR("Found sharing manager to handle %@"), v27, v28, v29, v30, (uint64_t)v22);

            goto LABEL_12;
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        if (v19)
          continue;
        break;
      }
    }

LABEL_12:
    if (*(_QWORD *)(*(_QWORD *)(a1 + 48) + 64))
    {
      v35 = objc_retainBlock(*(id *)(a1 + 56));
      v36 = *(_QWORD *)(a1 + 48);
      v37 = *(void **)(v36 + 96);
      *(_QWORD *)(v36 + 96) = v35;

      sub_100267524(*(id **)(*(_QWORD *)(a1 + 48) + 64), *(void **)(a1 + 48));
      sub_100261CCC(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 64), *(void **)(a1 + 40));
    }
    else
    {
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession cancelInvitationsWithIdentifiers:sentByOwnerKeyWithIdentifier:callback:]_block_invoke", 174, CFSTR("No sharing in progress"), v31, v32, v33, v34, v38);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession cancelInvitationsWithIdentifiers:sentByOwnerKeyWithIdentifier:callback:]_block_invoke", 160, CFSTR("No invitation identifiers provided to cancel"), v13, v14, v15, v16, v38);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 0);
  }
}

void sub_1002684CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSString *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSString *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSString *v39;
  void *v40;
  NSString *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  NSErrorUserInfoKey v46;
  void *v47;
  NSErrorUserInfoKey v48;
  void *v49;
  NSErrorUserInfoKey v50;
  void *v51;
  NSErrorUserInfoKey v52;
  void *v53;
  NSErrorUserInfoKey v54;
  void *v55;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession cancelInvitationWithIdentifier:reason:callback:]_block_invoke", 190, CFSTR("Invitation to cancel :%@"), a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    v13 = sub_1002600BC((uint64_t)KmlOwnerSharingManager, *(void **)(a1 + 32));
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = *(_QWORD *)(a1 + 40);
    v16 = *(void **)(v15 + 72);
    *(_QWORD *)(v15 + 72) = v14;

    if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 72))
    {
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession cancelInvitationWithIdentifier:reason:callback:]_block_invoke", 200, CFSTR("Found Initiator sharing session to handle %@"), v17, v18, v19, v20, *(_QWORD *)(a1 + 32));
      sub_100211068(*(id **)(*(_QWORD *)(a1 + 40) + 72), *(void **)(a1 + 40));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.sesd.kml.sharing"));
      v52 = NSLocalizedDescriptionKey;
      v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", KmlErrorString(125));
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v53 = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v21, 125, v24));

      v26 = *(_QWORD *)(a1 + 56);
      if (v26 == 1)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.sesd.kml.sharing"));
        v48 = NSLocalizedDescriptionKey;
        v41 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", KmlErrorString(103));
        v29 = (void *)objc_claimAutoreleasedReturnValue(v41);
        v49 = v29;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));
        v31 = v27;
        v32 = 103;
      }
      else
      {
        if (v26)
        {
LABEL_11:
          sub_10020CF7C(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 72), v25);
          v43 = objc_retainBlock(*(id *)(a1 + 48));
          v44 = *(_QWORD *)(a1 + 40);
          v35 = *(void **)(v44 + 104);
          *(_QWORD *)(v44 + 104) = v43;
          goto LABEL_12;
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.sesd.kml.sharing"));
        v50 = NSLocalizedDescriptionKey;
        v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", KmlErrorString(124));
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        v51 = v29;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1));
        v31 = v27;
        v32 = 124;
      }
      v42 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v31, v32, v30));

      v25 = (void *)v42;
      goto LABEL_11;
    }
    v33 = *(_QWORD *)(a1 + 48);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.sesd.kml"));
    v46 = NSLocalizedDescriptionKey;
    v39 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", KmlErrorString(109));
    v35 = (void *)objc_claimAutoreleasedReturnValue(v39);
    v47 = v35;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1));
    v37 = v25;
    v38 = 109;
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession cancelInvitationWithIdentifier:reason:callback:]_block_invoke", 193, CFSTR("No invitation identifiers provided to cancel"), v9, v10, v11, v12, v45);
    v33 = *(_QWORD *)(a1 + 48);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.sesd.kml"));
    v54 = NSLocalizedDescriptionKey;
    v34 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", KmlErrorString(206));
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v55 = v35;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1));
    v37 = v25;
    v38 = 206;
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v37, v38, v36));
  (*(void (**)(uint64_t, _QWORD, void *))(v33 + 16))(v33, 0, v40);

LABEL_12:
}

void sub_1002689F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9;
  void *v10;
  id *v11;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession removeSharedKeysWithIdentifiers:ownerKeyWithIdentifier:callback:]_block_invoke", 231, CFSTR("Owner key identifier: %@"), a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
  v11 = sub_100255B5C((id *)[KmlEndpointManager alloc], *(void **)(a1 + 32), 0);
  v9 = sub_1002590E0((uint64_t)v11, *(void **)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_100268B38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id *v9;
  uint64_t v10;
  uint64_t v11;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession countImmobilizerTokensForKeyWithIdentifier:callback:]_block_invoke", 243, CFSTR("Key identifier: %@"), a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
  v9 = sub_100255B5C((id *)[KmlEndpointManager alloc], *(void **)(a1 + 32), 0);
  v10 = 0;
  v11 = 0;
  sub_10025920C((uint64_t)v9, &v11, &v10);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_100268CC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id *v13;
  void *v14;
  KmlOwnerPairingManager *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id *v20;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession consumeTrackingReceipt:otherJSONData:forKeyWithIdentifier:callback:]_block_invoke", 259, &stru_100316BD0, a5, a6, a7, a8, v19);
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KmlKeyManagementSession consumeTrackingReceipt:otherJSONData:forKeyWithIdentifier:callback:]_block_invoke", 260, CFSTR("otherJsonData : %@"), v9, v10, v11, v12, *(_QWORD *)(a1 + 32));
  v20 = sub_100255B5C((id *)[KmlEndpointManager alloc], *(void **)(a1 + 40), 0);
  v13 = sub_1002562EC(v20, *(void **)(a1 + 48), *(void **)(a1 + 32));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = sub_1002228B4((uint64_t)KmlOwnerPairingManager, *(void **)(a1 + 40));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  if (v16)
  {
    v17 = sub_10021728C((uint64_t)v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    sub_1002235F0((uint64_t)v16, v14, v18);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void sub_100268E78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSString *v18;
  void *v19;
  void *v20;
  id v21;
  NSErrorUserInfoKey v22;
  void *v23;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession requestBindingAttestationDataForKeyWithIdentifier:callback:]_block_invoke", 277, &stru_100316BD0, a5, a6, a7, a8, (uint64_t)v21);
  v9 = sub_10024165C((uint64_t)KmlFriendSharingManager, *(void **)(a1 + 40));
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 80);
  *(_QWORD *)(v11 + 80) = v10;

  v13 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  if (v13)
  {
    v21 = 0;
    v14 = sub_1002439A8(v13, &v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = v21;
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.sesd.kml.sharing"));
    v22 = NSLocalizedDescriptionKey;
    v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", KmlErrorString(210));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v23 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v17, 210, v20));

    v15 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_1002690F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSString *v17;
  void *v18;
  void *v19;
  NSErrorUserInfoKey v20;
  void *v21;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession setBindingAttestation:forKeyWithIdentifier:callback:]_block_invoke", 295, CFSTR("Set Binding Attestation Data for key with id: %@"), a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
  v9 = sub_10024165C((uint64_t)KmlFriendSharingManager, *(void **)(a1 + 32));
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(void **)(v11 + 80);
  *(_QWORD *)(v11 + 80) = v10;

  v13 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
  if (v13)
  {
    v14 = sub_100243A10(v13, *(void **)(a1 + 48));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.sesd.kml.sharing"));
    v20 = NSLocalizedDescriptionKey;
    v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", KmlErrorString(210));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v21 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v16, 210, v19));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void sub_100269334(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSString *v18;
  void *v19;
  void *v20;
  id v21;
  NSErrorUserInfoKey v22;
  void *v23;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession getPreTrackRequestForInvitationWithIdentifier:completionHandler:]_block_invoke", 312, CFSTR("Get pre-track request for invitation with id: %@"), a5, a6, a7, a8, a1[4]);
  v9 = sub_100240EE0((uint64_t)KmlFriendSharingManager, (void *)a1[4], 0);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = a1[5];
  v12 = *(void **)(v11 + 80);
  *(_QWORD *)(v11 + 80) = v10;

  v13 = *(void **)(a1[5] + 80);
  if (v13)
  {
    v21 = 0;
    v14 = sub_100243BF0(v13, &v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = v21;
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.sesd.kml.sharing"));
    v22 = NSLocalizedDescriptionKey;
    v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", KmlErrorString(210));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v23 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v17, 210, v20));

    v15 = 0;
  }
  (*(void (**)(void))(a1[6] + 16))();

}

void sub_100269594(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSString *v18;
  void *v19;
  void *v20;
  id v21;
  NSErrorUserInfoKey v22;
  void *v23;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession getPreTrackRequestForKeyWithIdentifier:callback:]_block_invoke", 331, CFSTR("Get pre-track request for key with id: %@"), a5, a6, a7, a8, a1[4]);
  v9 = sub_10024165C((uint64_t)KmlFriendSharingManager, (void *)a1[4]);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = a1[5];
  v12 = *(void **)(v11 + 80);
  *(_QWORD *)(v11 + 80) = v10;

  v13 = *(void **)(a1[5] + 80);
  if (v13)
  {
    v21 = 0;
    v14 = sub_100243BF0(v13, &v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = v21;
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.sesd.kml.sharing"));
    v22 = NSLocalizedDescriptionKey;
    v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", KmlErrorString(210));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v23 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v17, 210, v20));

    v15 = 0;
  }
  (*(void (**)(void))(a1[6] + 16))();

}

void sub_100269818(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  NSString *v22;
  void *v23;
  void *v24;
  id v25;
  NSErrorUserInfoKey v26;
  void *v27;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession ppidRequestForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:]_block_invoke", 350, CFSTR("Get ppid fetch request for Invitation with id: %@"), a5, a6, a7, a8, a1[4]);
  KmlLogFunc_InternalOnly(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession ppidRequestForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:]_block_invoke", 351, CFSTR("mailboxIdentifier : %@"), v9, v10, v11, v12, a1[5]);
  v13 = sub_100241A7C((uint64_t)KmlFriendSharingManager, (void *)a1[4], (void *)a1[5]);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = a1[6];
  v16 = *(void **)(v15 + 80);
  *(_QWORD *)(v15 + 80) = v14;

  v17 = *(void **)(a1[6] + 80);
  if (v17)
  {
    v25 = 0;
    v18 = sub_100243C58(v17, &v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = v25;
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.sesd.kml.sharing"));
    v26 = NSLocalizedDescriptionKey;
    v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", KmlErrorString(109));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v27 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
    v20 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v21, 109, v24));

    v19 = 0;
  }
  (*(void (**)(void))(a1[7] + 16))();

}

void sub_100269AC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  dispatch_queue_t *v13;
  dispatch_queue_t *v14;
  void *v15;
  void *v16;
  NSString *v17;
  void *v18;
  void *v19;
  NSErrorUserInfoKey v20;
  void *v21;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession setProductPlanIdentifier:forInvitationIdentifier:completion:]_block_invoke", 373, CFSTR("invitationIdentifier: %@"), a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
  v9 = sub_100240EE0((uint64_t)KmlFriendSharingManager, *(void **)(a1 + 32), 0);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(void **)(v11 + 80);
  *(_QWORD *)(v11 + 80) = v10;

  v13 = *(dispatch_queue_t **)(*(_QWORD *)(a1 + 40) + 80);
  if (v13)
  {
    v14 = sub_100243CC0(v13, *(void **)(a1 + 48));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.sesd.kml.sharing"));
    v20 = NSLocalizedDescriptionKey;
    v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", KmlErrorString(109));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v21 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v16, 109, v19));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void sub_100269D2C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSString *v22;
  void *v23;
  void *v24;
  NSErrorUserInfoKey v25;
  void *v26;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession readerInformationForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:]_block_invoke", 394, CFSTR("Get readerInformation for Invitation with id: %@"), a5, a6, a7, a8, a1[4]);
  KmlLogFunc_InternalOnly(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession readerInformationForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:]_block_invoke", 395, CFSTR("mailboxIdentifier : %@"), v9, v10, v11, v12, a1[5]);
  v13 = sub_100241A7C((uint64_t)KmlFriendSharingManager, (void *)a1[4], (void *)a1[5]);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = a1[6];
  v16 = *(void **)(v15 + 80);
  *(_QWORD *)(v15 + 80) = v14;

  v17 = *(_QWORD *)(a1[6] + 80);
  if (v17)
  {
    v18 = sub_10024C29C(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = 0;
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.sesd.kml.sharing"));
    v25 = NSLocalizedDescriptionKey;
    v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", KmlErrorString(109));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v26 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v21, 109, v24));

    v19 = 0;
  }
  (*(void (**)(void))(a1[7] + 16))();

}

void sub_100269FC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  _OWORD v15[2];
  id v16;
  __int128 v17;
  __int128 v18;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession hasUpgradeAvailableForKeyWithIdentifier:versionType:versions:completionHandler:]_block_invoke", 417, &stru_100316BD0, a5, a6, a7, a8, *(uint64_t *)&v15[0]);
  v9 = sub_100255B5C((id *)[KmlEndpointManager alloc], *(void **)(a1 + 32), 0);
  v17 = 0u;
  v18 = 0u;
  v10 = *(_QWORD *)(a1 + 56);
  v11 = *(void **)(a1 + 40);
  v16 = 0;
  sub_100259774((uint64_t)v9, v10, v11, &v16, (uint64_t *)&v17);
  v12 = v16;
  v13 = *(_QWORD *)(a1 + 48);
  v15[0] = v17;
  v15[1] = v18;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithDAAvailableVersionUpgrade:](NSValue, "valueWithDAAvailableVersionUpgrade:", v15));
  (*(void (**)(uint64_t, void *, id))(v13 + 16))(v13, v14, v12);

}

void sub_10026A18C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  id *v12;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession upgradeKeyWithIdentifier:versionType:version:upgradeInformation:completionHandler:]_block_invoke", 432, &stru_100316BD0, a5, a6, a7, a8, v11);
  v12 = sub_100255B5C((id *)[KmlEndpointManager alloc], *(void **)(a1 + 32), 0);
  v9 = sub_100259840(v12, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(void **)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_10026A2E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id *v16;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession finalizeUpgradeForKeyWithIdentifier:versionType:version:revert:completionHandler:]_block_invoke", 448, &stru_100316BD0, a5, a6, a7, a8, v15);
  v16 = sub_100255B5C((id *)[KmlEndpointManager alloc], *(void **)(a1 + 32), 0);
  v13 = sub_10025A4E4(v16, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), v9, v10, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_10026A44C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void **v9;
  void *v10;
  uint64_t v11;
  void **v12;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlKeyManagementSession updateConfiguration:forKeyWithIdentifier:completionHandler:]_block_invoke", 462, &stru_100316BD0, a5, a6, a7, a8, v11);
  v12 = sub_100255B5C((id *)[KmlEndpointManager alloc], *(void **)(a1 + 32), 0);
  v9 = sub_10025B788(v12, *(void **)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

id sub_10026A568(uint64_t a1)
{
  uint64_t v2;
  objc_super v4;

  sub_10026A5B4(*(_QWORD *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)KmlKeyManagementSession;
  return objc_msgSendSuper2(&v4, "endSessionWithCompletion:", v2);
}

void sub_10026A5B4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    sub_100267524(*(id **)(a1 + 64), 0);
    v2 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = 0;

    v3 = *(void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = 0;

    v4 = *(void **)(a1 + 96);
    *(_QWORD *)(a1 + 96) = 0;

  }
}

uint64_t sub_10026A6D8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + 16))();
}

uint64_t sub_10026A7DC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) + 16))();
}

id *sub_10026A888(id *a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  id *v11;
  objc_super v13;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)KmlMessageToSend;
    v11 = (id *)objc_msgSendSuper2(&v13, "init");
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
    }
  }

  return a1;
}

id sub_10026A980(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, a2);
  objc_opt_self(a1);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10026AA50;
  v5[3] = &unk_1003048F0;
  objc_copyWeak(&v6, &location);
  if (qword_1003549A0 != -1)
    dispatch_once(&qword_1003549A0, v5);
  v3 = (id)qword_100354998;
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void sub_10026AA3C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_10026AA50(uint64_t a1)
{
  KmlPeerToPeerConnection *v2;
  id *v3;
  void *v4;
  id WeakRetained;

  v2 = [KmlPeerToPeerConnection alloc];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = sub_10026AAB0((id *)&v2->super.isa, WeakRetained);
  v4 = (void *)qword_100354998;
  qword_100354998 = (uint64_t)v3;

}

id *sub_10026AAB0(id *a1, void *a2)
{
  id v3;
  dispatch_queue_t v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  objc_super v20;
  id location;

  objc_initWeak(&location, a2);
  if (a1)
  {
    v20.receiver = a1;
    v20.super_class = (Class)KmlPeerToPeerConnection;
    a1 = (id *)objc_msgSendSuper2(&v20, "init");
    if (a1)
    {
      v3 = objc_loadWeakRetained(&location);
      objc_storeWeak(a1 + 3, v3);

      v4 = dispatch_queue_create("com.apple.sesd.kml.p2pConnection", 0);
      v5 = a1[2];
      a1[2] = v4;

      v6 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v7 = a1[4];
      a1[4] = (id)v6;

      v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v9 = a1[5];
      a1[5] = (id)v8;

      v10 = objc_claimAutoreleasedReturnValue(+[NSCountedSet set](NSCountedSet, "set"));
      v11 = a1[6];
      a1[6] = (id)v10;

      v12 = objc_msgSend(objc_alloc((Class)IDSService), "initWithService:", CFSTR("com.apple.private.alloy.keysharing"));
      v13 = a1[1];
      a1[1] = v12;

      objc_msgSend(a1[1], "addDelegate:queue:", a1, a1[2]);
      v14 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v15 = a1[9];
      a1[9] = (id)v14;

      v16 = a1[10];
      a1[10] = 0;

      *((_BYTE *)a1 + 64) = 0;
      v17 = objc_claimAutoreleasedReturnValue(+[NWPathEvaluator sharedDefaultEvaluator](NWPathEvaluator, "sharedDefaultEvaluator"));
      v18 = a1[7];
      a1[7] = (id)v17;

      objc_msgSend(a1[7], "addObserver:forKeyPath:options:context:", a1, CFSTR("path"), 5, 0);
    }
  }
  objc_destroyWeak(&location);
  return a1;
}

void sub_10026AC2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10026AD28(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("path")))
    sub_10026AD68(*(_QWORD *)(a1 + 40));
}

void sub_10026AD68(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  void *v4;
  unsigned int v5;
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

  if (a1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "path"));
    v3 = objc_msgSend(v2, "usesInterfaceType:", 1);

    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "path"));
    v5 = objc_msgSend(v4, "usesInterfaceType:", 2);

    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlPeerToPeerConnection sync_updateConnectionState]", 435, CFSTR("NWPath - Wifi : %d, Cellular : %d"), v6, v7, v8, v9, v3);
    sub_10026C3DC(a1, v3 | v5, v10, v11, v12, v13, v14, v15);
  }
}

void sub_10026AE0C(uint64_t a1, void *a2, char a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  char v10;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v7 = *(NSObject **)(a1 + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10026AEA0;
    block[3] = &unk_10030FE10;
    v10 = a3;
    block[4] = a1;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

void sub_10026AEA0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  id *v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  if (*(_BYTE *)(a1 + 48)
    || (v2 = *(_QWORD *)(a1 + 32), *(_BYTE *)(v2 + 64))
    || ((v3 = *(_QWORD *)(a1 + 40)) == 0 ? (v4 = 0) : (v4 = *(void **)(v3 + 24)), sub_10026AFE8(v2, v4)))
  {
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      v10 = *(void **)(v9 + 8);
    else
      v10 = 0;
    v12 = *(id **)(a1 + 32);
    v11 = *(_QWORD **)(a1 + 40);
    if (v11)
      v11 = (_QWORD *)v11[2];
    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
      v14 = *(void **)(v13 + 24);
    else
      v14 = 0;
    v15 = v11;
    v21 = v10;
    sub_10026B164(v12, v21, v15, v14);

  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlPeerToPeerConnection sendMessage:assumeInitialConnectivity:]_block_invoke", 153, CFSTR("Internet not reachable. Queue up the message"), v5, v6, v7, v8, v20);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addObject:", *(_QWORD *)(a1 + 40));
    if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "count") >= 0xB)
    {
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlPeerToPeerConnection sendMessage:assumeInitialConnectivity:]_block_invoke", 156, CFSTR("Max (%d) messages are already queued, drain the oldest message"), v16, v17, v18, v19, 10);
      sub_10026B5AC(*(id **)(a1 + 32));
    }
  }
}

uint64_t sub_10026AFE8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v3 = a2;
  v8 = v3;
  if (a1)
  {
    if (v3)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 8), "devices"));
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v24 != v12)
              objc_enumerationMutation(v9);
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "uniqueIDOverride"));
            v15 = objc_msgSend(v14, "isEqualToString:", v8);

            if (v15)
            {
              v20 = 1;
              KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlPeerToPeerConnection internal_isOurOwnDeviceWithId:]", 361, CFSTR("ID %@ is of our own device"), v16, v17, v18, v19, (uint64_t)v8);

              goto LABEL_15;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v11)
            continue;
          break;
        }
      }

    }
    else
    {
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlPeerToPeerConnection internal_isOurOwnDeviceWithId:]", 355, CFSTR("RemoteId should be non-nil to check this"), v4, v5, v6, v7, v22);
    }
  }
  v20 = 0;
LABEL_15:

  return v20;
}

void sub_10026B164(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  unsigned int v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  NSString *v45;
  void *v46;
  void *v47;
  id WeakRetained;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[2];
  _QWORD v59[2];
  _BYTE v60[128];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v14 = v9;
  if (a1)
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlPeerToPeerConnection internal_sendMessage:withIdentifier:toRemoteIdsIdentifier:]", 465, CFSTR("Remote Id: %@"), v10, v11, v12, v13, (uint64_t)v9);
    if (v14)
    {
      v50 = v7;
      v15 = v8;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[1], "devices"));
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v55;
LABEL_5:
        v20 = 0;
        while (1)
        {
          if (*(_QWORD *)v55 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "uniqueIDOverride"));
          v23 = objc_msgSend(v22, "isEqualToString:", v14);

          if ((v23 & 1) != 0)
            break;
          if (v18 == (id)++v20)
          {
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
            if (v18)
              goto LABEL_5;
            goto LABEL_11;
          }
        }
        KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlPeerToPeerConnection internal_sendMessage:withIdentifier:toRemoteIdsIdentifier:]", 474, CFSTR("Found our own device with ID %@"), v24, v25, v26, v27, (uint64_t)v14);
        v28 = v21;

        v8 = v15;
        v7 = v50;
        if (!v28)
          goto LABEL_14;
        v29 = (void *)IDSCopyIDForDevice(v28);
        goto LABEL_19;
      }
LABEL_11:

      v8 = v15;
      v7 = v50;
    }
LABEL_14:
    if (objc_msgSend(v14, "_appearsToBeEmail"))
    {
      v30 = IDSCopyIDForEmailAddress(v14);
    }
    else
    {
      if (!objc_msgSend(v14, "_appearsToBePhoneNumber"))
      {
        v51 = 0;
        goto LABEL_26;
      }
      v30 = IDSCopyIDForPhoneNumber(v14);
    }
    v29 = (void *)v30;
    v28 = 0;
LABEL_19:
    v51 = v28;
    if (v29)
    {
      v49 = (uint64_t)v8;
      v31 = v7;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v29));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      objc_msgSend(v33, "setObject:forKeyedSubscript:", &off_1003236A0, IDSSendMessageOptionTimeoutKey);
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "objectForKeyedSubscript:", v14));
      if (v34)
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v34, IDSSendMessageOptionFromIDKey);
      v35 = a1[1];
      v52 = 0;
      v53 = 0;
      v36 = objc_msgSend(v35, "sendMessage:toDestinations:priority:options:identifier:error:", v31, v32, 300, v33, &v53, &v52);
      v37 = v53;
      v38 = v52;
      sub_10026BA94((uint64_t)a1, v14);

      if (v36)
      {
        KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlPeerToPeerConnection internal_sendMessage:withIdentifier:toRemoteIdsIdentifier:]", 509, CFSTR("P2PConnection: Requested to send message(%@) - uuid %@"), v39, v40, v41, v42, v49);
        objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v49, v37);
        v7 = v31;
        v8 = (id)v49;
        v43 = v51;
LABEL_28:

        goto LABEL_29;
      }
      v7 = v31;
      v8 = (id)v49;
LABEL_27:
      v43 = v51;
      KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[KmlPeerToPeerConnection internal_sendMessage:withIdentifier:toRemoteIdsIdentifier:]", 512, CFSTR("P2PConnection: Failed to send with uuid %@ error %@"), v39, v40, v41, v42, (uint64_t)v37);
      WeakRetained = objc_loadWeakRetained(a1 + 3);
      objc_msgSend(WeakRetained, "handleSendMessageResult:forMessageIdentifier:", v38, v8);

      goto LABEL_28;
    }
LABEL_26:
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.sesd.kml.sharing"));
    v58[0] = NSLocalizedDescriptionKey;
    v45 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", KmlErrorString(106));
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    v58[1] = NSLocalizedFailureReasonErrorKey;
    v59[0] = v46;
    v59[1] = CFSTR("Failed to get a destination from rawAddress");
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v59, v58, 2));
    v38 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v44, 106, v47));

    v37 = 0;
    v29 = 0;
    goto LABEL_27;
  }
LABEL_29:

}

void sub_10026B5AC(id *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id *v14;

  if (a1 && objc_msgSend(a1[9], "count"))
  {
    v14 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[9], "firstObject"));
    objc_msgSend(a1[9], "removeFirstObject");
    if (v14)
    {
      v6 = v14[2];
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlPeerToPeerConnection sendFirstQueuedMessage]", 423, CFSTR("Message id - %@, destination - %@"), v7, v8, v9, v10, (uint64_t)v6);

      v11 = v14[1];
      v12 = v14[2];
      v13 = v14[3];
    }
    else
    {
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlPeerToPeerConnection sendFirstQueuedMessage]", 423, CFSTR("Message id - %@, destination - %@"), v2, v3, v4, v5, 0);
      v12 = 0;
      v11 = 0;
      v13 = 0;
    }
    sub_10026B164(a1, v11, v12, v13);

  }
}

void sub_10026B6C8(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[5];

  if (a1)
  {
    v1 = *(NSObject **)(a1 + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10026B724;
    block[3] = &unk_100302AA0;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

void sub_10026B724(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  id WeakRetained;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlPeerToPeerConnection checkForActiveAccounts]_block_invoke", 166, CFSTR("P2PConnection: Checking for active IDS accounts"), a5, a6, a7, a8, v18);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v16 = sub_10026B798(*(_QWORD *)(a1 + 32), v9, v10, v11, v12, v13, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  objc_msgSend(WeakRetained, "handleConnectionSetupResult:", v17);

}

id sub_10026B798(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  NSErrorUserInfoKey v37;
  void *v38;

  if (!a1)
    return 0;
  if (*(_QWORD *)(a1 + 80))
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlPeerToPeerConnection internal_getActiveAccount]", 388, CFSTR("We already active IDS account with login:%@"), a5, a6, a7, a8, *(_QWORD *)(a1 + 80));
    return 0;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.sesd.kml.sharing"));
  v37 = NSLocalizedDescriptionKey;
  v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", KmlErrorString(107));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v38 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v10, 107, v13));

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 8), "accounts"));
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "loginID"));
        KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlPeerToPeerConnection internal_getActiveAccount]", 394, CFSTR("P2PConnection: Checking IDS account with login:%@"), v22, v23, v24, v25, (uint64_t)v21);

        if (objc_msgSend(v20, "canSend"))
        {

          v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "loginID"));
          v27 = *(void **)(a1 + 80);
          *(_QWORD *)(a1 + 80) = v26;

          KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlPeerToPeerConnection internal_getActiveAccount]", 398, CFSTR("P2PConnection: Found active IDS account with login:%@"), v28, v29, v30, v31, *(_QWORD *)(a1 + 80));
          v14 = 0;
          goto LABEL_15;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v17)
        continue;
      break;
    }
  }
LABEL_15:

  return v14;
}

void sub_10026B9FC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 16);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10026BA88;
    v6[3] = &unk_100304370;
    v6[4] = a1;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

void sub_10026BA88(uint64_t a1)
{
  sub_10026BA94(*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void sub_10026BA94(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 48), "removeObject:", v7);
    if (!objc_msgSend(*(id *)(a1 + 48), "countForObject:", v7))
    {
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlPeerToPeerConnection sync_cleanupRemoteIdentifier:]", 345, CFSTR("cleaning up remoteAndOurIdentifierMap for remote id %@"), v3, v4, v5, v6, (uint64_t)v7);
      objc_msgSend(*(id *)(a1 + 40), "removeObjectForKey:", v7);
    }
  }

}

uint64_t sub_10026BB14(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v11;
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v3 = a2;
  v8 = v3;
  if (a1)
  {
    if (v3)
    {
      v15 = 0;
      v16 = &v15;
      v17 = 0x2020000000;
      v18 = 0;
      dispatch_assert_queue_not_V2(*(dispatch_queue_t *)(a1 + 16));
      v9 = *(NSObject **)(a1 + 16);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10026BC24;
      block[3] = &unk_10030F268;
      v14 = &v15;
      block[4] = a1;
      v13 = v8;
      dispatch_sync(v9, block);
      a1 = *((_BYTE *)v16 + 24) != 0;

      _Block_object_dispose(&v15, 8);
    }
    else
    {
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlPeerToPeerConnection isOurOwnDeviceWithId:]", 181, CFSTR("RemoteId should be non-nil to check this"), v4, v5, v6, v7, v11);
      a1 = 0;
    }
  }

  return a1;
}

void sub_10026BC0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10026BC24(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = sub_10026AFE8(*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "accounts"));
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v5)
            objc_enumerationMutation(v2);
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "loginID"));
          v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 40));

          if (v8)
          {
            KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlPeerToPeerConnection isOurOwnDeviceWithId:]_block_invoke", 191, CFSTR("%@ is our own account ID"), v9, v10, v11, v12, *(_QWORD *)(a1 + 40));
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
            goto LABEL_12;
          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

dispatch_queue_t *sub_10026BD9C(dispatch_queue_t *a1)
{
  dispatch_queue_t *v1;
  NSObject *v2;
  _QWORD block[5];

  if (a1)
  {
    v1 = a1;
    dispatch_assert_queue_not_V2(a1[2]);
    v2 = v1[2];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10026BE10;
    block[3] = &unk_100302AA0;
    block[4] = v1;
    dispatch_sync(v2, block);
    a1 = v1[10];
  }
  return a1;
}

void sub_10026BE10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v8 = sub_10026B798(*(_QWORD *)(a1 + 32), a2, a3, a4, a5, a6, a7, a8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (v9)
  {
    v14 = v9;
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlPeerToPeerConnection ourActiveIDSId]_block_invoke", 219, CFSTR("Failed to find active IDS ID - %@"), v10, v11, v12, v13, (uint64_t)v9);
    v9 = v14;
  }

}

void sub_10026BE5C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    v8 = *(NSObject **)(a1 + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10026BF04;
    block[3] = &unk_100304490;
    v10 = v6;
    v11 = a1;
    v12 = v5;
    dispatch_async(v8, block);

  }
}

void sub_10026BF04(uint64_t a1)
{
  unsigned int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  id v15;
  id v16;
  __CFString *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  _UNKNOWN **v24;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_appearsToBeEmail");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    v4 = IDSCopyIDForEmailAddress(v3);
  }
  else
  {
    if (!objc_msgSend(v3, "_appearsToBePhoneNumber"))
    {
      v16 = 0;
      v15 = 0;
      v9 = 0;
      goto LABEL_10;
    }
    v4 = IDSCopyIDForPhoneNumber(*(_QWORD *)(a1 + 32));
  }
  v9 = (void *)v4;
  if (!v4)
  {
    v16 = 0;
    v15 = 0;
    goto LABEL_10;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v4));
  v23 = IDSSendMessageOptionTimeoutKey;
  v24 = &off_1003236A0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
  v12 = *(_QWORD *)(a1 + 48);
  v13 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  v21 = 0;
  v22 = 0;
  v14 = objc_msgSend(v13, "sendData:toDestinations:priority:options:identifier:error:", v12, v10, 300, v11, &v22, &v21);
  v15 = v22;
  v16 = v21;

  if (!v14)
  {
LABEL_10:
    v17 = CFSTR("Failed to send test data");
    v18 = OS_LOG_TYPE_ERROR;
    v19 = 250;
    goto LABEL_11;
  }
  v17 = CFSTR("Test data sent");
  v18 = OS_LOG_TYPE_INFO;
  v19 = 248;
LABEL_11:
  KmlLogFunc2(v18, (uint64_t)"-[KmlPeerToPeerConnection sendTestData:toRemoteIdentifier:]_block_invoke", v19, v17, v5, v6, v7, v8, v20);

}

void sub_10026C164(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9;
  id WeakRetained;
  id v11;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlPeerToPeerConnection service:account:incomingData:fromID:context:]_block_invoke", 269, CFSTR("P2PConnection: Received data from:%@ context:%@"), a5, a6, a7, a8, a1[4]);
  v11 = (id)IDSCopyRawAddressForDestination(a1[4]);
  v9 = objc_msgSend(objc_alloc((Class)NSData), "initWithData:", a1[6]);
  WeakRetained = objc_loadWeakRetained((id *)(a1[7] + 24));
  objc_msgSend(WeakRetained, "handleIncomingTestData:fromRemoteIdsIdentifier:", v9, v11);

}

void sub_10026C2C0(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "deviceForFromID:", *(_QWORD *)(a1 + 40)));
  v3 = v2;
  if (v2)
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "uniqueIDOverride"));
  else
    v4 = IDSCopyRawAddressForDestination(*(_QWORD *)(a1 + 40));
  v18 = (id)v4;
  v5 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:", *(_QWORD *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "toID"));
  if (v10)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKeyedSubscript:", v10, v18);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", v18);
  }
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlPeerToPeerConnection service:account:incomingMessage:fromID:context:]_block_invoke", 297, CFSTR("P2PConnection: Received message from:%@ toOurId:%@"), v6, v7, v8, v9, *(_QWORD *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "handleIncomingMessage:fromRemoteIdsIdentifier:", v5, v18);

  if (!v3)
    sub_10026C3DC(*(_QWORD *)(a1 + 32), 1, v12, v13, v14, v15, v16, v17);

}

void sub_10026C3DC(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlPeerToPeerConnection sync_setInternetAvailability:]", 453, CFSTR("Internet available: before - %d, now - %d"), a5, a6, a7, a8, *(unsigned __int8 *)(a1 + 64));
    if (*(unsigned __int8 *)(a1 + 64) != a2)
    {
      *(_BYTE *)(a1 + 64) = a2;
      if (a2)
        sub_10026C6CC((id *)a1);
    }
  }
}

void sub_10026C508(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  uint64_t v12;
  void *v13;
  id v14;

  v2 = *(_QWORD *)(a1 + 32);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 56)));
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlPeerToPeerConnection service:account:identifier:didSendWithSuccess:error:]_block_invoke", 311, CFSTR("P2PConnection: Sent data with identifier:%@ result:%@"), v3, v4, v5, v6, v2);

  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)));
  if (v14)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 24));
    objc_msgSend(WeakRetained, "handleSendMessageResult:forMessageIdentifier:", *(_QWORD *)(a1 + 48), v14);

  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[KmlPeerToPeerConnection service:account:identifier:didSendWithSuccess:error:]_block_invoke", 318, CFSTR("P2PConnection: We didn't send anything, so dropping the send receipt"), v7, v8, v9, v10, v12);
  }

}

void sub_10026C634(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  v19 = v2;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = 0;

  v12 = sub_10026B798(*(_QWORD *)(a1 + 32), v5, v6, v7, v8, v9, v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v18 = (void *)v13;
  if (v13)
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlPeerToPeerConnection service:activeAccountsChanged:]_block_invoke", 330, CFSTR("Keeping old ID as we failed to find changed active IDS ID - %@"), v14, v15, v16, v17, v13);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), v2);
  }

}

void sub_10026C6CC(id *a1)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (a1)
  {
    v2 = (char *)objc_msgSend(a1[9], "count");
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlPeerToPeerConnection drainQueuedMessages]", 409, CFSTR("Number of messages queued up : %lu"), v3, v4, v5, v6, (uint64_t)v2);
    for (; v2; --v2)
      sub_10026B5AC(a1);
  }
}

uint64_t SSEIsFeatureSupported(int a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  BOOL v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v10;
  unsigned int v11;

  v11 = 0;
  v10 = 0;
  sub_10026CC4C();
  if (byte_1003549D0)
  {
    v2 = SSEGetVersion(&v11);
    if ((_DWORD)v2)
    {
      v3 = v2;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100270B9C();
    }
    else
    {
      v3 = 0;
      switch(a1)
      {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 8:
        case 9:
        case 10:
        case 18:
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
          return v3;
        case 7:
        case 11:
        case 15:
        case 26:
        case 27:
        case 28:
          v4 = HIWORD(v11);
          goto LABEL_8;
        case 12:
        case 25:
          v5 = v11 > 1;
          goto LABEL_26;
        case 13:
        case 14:
          v5 = v11 > 2;
          goto LABEL_26;
        case 16:
        case 35:
        case 36:
        case 37:
        case 38:
        case 39:
          v4 = v11 >> 18;
          goto LABEL_8;
        case 17:
        case 40:
          v6 = v11;
          v7 = 393215;
          goto LABEL_25;
        case 29:
        case 30:
        case 31:
          v4 = v11 >> 17;
          goto LABEL_8;
        case 32:
        case 45:
        case 46:
        case 47:
        case 48:
          v4 = v11 >> 19;
LABEL_8:
          if (v4)
            return 0;
          else
            return 4294967279;
        case 33:
          v6 = v11;
          v7 = 655359;
          goto LABEL_25;
        case 34:
          v8 = sub_10026CAC4(&v10);
          if ((_DWORD)v8)
          {
            v3 = v8;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              sub_100270B0C();
          }
          else if ((v10 & 1) != 0)
          {
            return 0;
          }
          else
          {
            return 4294967279;
          }
          return v3;
        case 41:
        case 42:
          v5 = HIWORD(v11) > 4u;
          goto LABEL_26;
        case 43:
        case 44:
          v6 = v11;
          v7 = 458751;
          goto LABEL_25;
        case 49:
          v6 = v11;
          v7 = 589823;
LABEL_25:
          v5 = v6 > v7;
LABEL_26:
          if (v5)
            v3 = 0;
          else
            v3 = 4294967279;
          break;
        default:
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_100270A7C();
          return 4294967279;
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1002709EC();
    return 4294967279;
  }
  return v3;
}

uint64_t SSEGetVersion(_DWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  size_t outputStructCnt;
  unsigned int outputStruct;
  uint64_t inputStruct;

  if (dword_1003549B8)
  {
    v2 = 0;
    goto LABEL_10;
  }
  inputStruct = 0x153534563;
  outputStruct = 0;
  v3 = sub_10026CC4C();
  if ((_DWORD)v3)
  {
    v2 = v3;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100270DDC();
  }
  else
  {
    outputStructCnt = 4;
    v4 = IOConnectCallStructMethod(dword_1003549BC, 0, &inputStruct, 8uLL, &outputStruct, &outputStructCnt);
    if (!(_DWORD)v4)
    {
      if (outputStructCnt == 4)
      {
        v5 = outputStruct;
        if (outputStruct)
        {
          v2 = 0;
          if (outputStruct >= 0xA0000)
            v5 = 655360;
          dword_1003549B8 = v5;
          goto LABEL_10;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_100270C2C();
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100270CBC();
      }
      v2 = 4294967290;
      goto LABEL_10;
    }
    v2 = v4;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100270D4C();
  }
LABEL_10:
  if (a1)
    *a1 = dword_1003549B8;
  return v2;
}

uint64_t sub_10026CAC4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  size_t v7;
  uint64_t outputStruct;
  uint64_t inputStruct;
  unsigned int v10;

  if (a1)
  {
    if ((byte_1003549E0 & 1) != 0)
    {
LABEL_10:
      v5 = 0;
      *a1 = qword_1003549D8;
      return v5;
    }
    v10 = 0;
    v2 = SSEGetVersion(&v10);
    if ((_DWORD)v2)
    {
      v5 = v2;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_1002710AC();
    }
    else
    {
      if (v10 < 0x30000)
      {
LABEL_9:
        byte_1003549E0 = 1;
        goto LABEL_10;
      }
      outputStruct = 0;
      inputStruct = 0x1E53534563;
      v3 = sub_10026CC4C();
      if ((_DWORD)v3)
      {
        v5 = v3;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_10027101C();
      }
      else
      {
        v7 = 8;
        v4 = IOConnectCallStructMethod(dword_1003549BC, 0, &inputStruct, 8uLL, &outputStruct, &v7);
        if ((_DWORD)v4)
        {
          v5 = v4;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_100270F8C();
        }
        else
        {
          if (v7 == 8)
          {
            qword_1003549D8 = outputStruct;
            goto LABEL_9;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_100270EFC();
          return 4294967290;
        }
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100270E6C();
    return 4294967292;
  }
  return v5;
}

uint64_t sub_10026CC4C()
{
  uint64_t v0;
  const __CFDictionary *v1;
  io_service_t MatchingService;
  io_object_t v3;
  uint64_t v4;
  IONotificationPort *v5;
  NSObject *v6;
  FILE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  size_t v17;
  _QWORD v18[2];
  int v19[2];

  if ((byte_1003549E1 & 1) == 0)
  {
    if (qword_1003549F8 != -1)
      dispatch_once(&qword_1003549F8, &stru_10030FE50);
    if ((byte_1003549F4 & 1) != 0 || byte_100354F48)
    {
      byte_1003549D0 = 1;
    }
    else
    {
      if (qword_100354A08 != -1)
        dispatch_once(&qword_100354A08, &stru_10030FE70);
      byte_1003549D0 = byte_100354A00;
      if (!byte_100354A00)
      {
        byte_1003549E1 = 1;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_10027137C();
        goto LABEL_13;
      }
    }
    v1 = IOServiceMatching("AppleSSE");
    MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v1);
    if (!MatchingService)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_10027113C();
      v0 = 4294967276;
      goto LABEL_14;
    }
    v3 = MatchingService;
    v4 = IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)&dword_1003549BC);
    if ((_DWORD)v4)
    {
      v0 = v4;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_1002712EC();
      IOObjectRelease(v3);
      goto LABEL_14;
    }
    v5 = IONotificationPortCreate(kIOMasterPortDefault);
    qword_1003549E8 = (uint64_t)v5;
    if (v5)
      goto LABEL_24;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027125C();
    v5 = (IONotificationPort *)qword_1003549E8;
    if (qword_1003549E8)
    {
LABEL_24:
      v6 = dispatch_get_global_queue(21, 0);
      IONotificationPortSetDispatchQueue(v5, v6);

      if (IOServiceAddInterestNotification((IONotificationPortRef)qword_1003549E8, v3, "IOGeneralInterest", (IOServiceInterestCallback)sub_100270094, 0, (io_object_t *)&dword_1003549F0)&& os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_1002711CC();
      }
    }
    if (qword_100354A08 != -1)
      dispatch_once(&qword_100354A08, &stru_10030FE70);
    if (byte_100354A01)
    {
      if (qword_1003549F8 != -1)
        dispatch_once(&qword_1003549F8, &stru_10030FE50);
      if ((byte_1003549F4 & 1) == 0)
      {
        v7 = fopen("/var/mobile/Library/Logs/AppleSSE.log", "a");
        qword_100354A10 = (uint64_t)v7;
        if (v7)
        {
          if (ftell(v7) < 1)
            chmod("/var/mobile/Library/Logs/AppleSSE.log", 0x1B6u);
          else
            fputs("\n", (FILE *)qword_100354A10);
          v18[1] = 0;
          *(_QWORD *)v19 = 0x4100000001;
          v17 = 16;
          v18[0] = 0;
          sysctl(v19, 2u, v18, &v17, 0, 0);
          sub_1002703B8("AppleSSE Log Starts - System Version %s", v8, v9, v10, v11, v12, v13, v14, (char)v18);
          sub_1002704A0(0, 0);
        }
      }
    }
    byte_1003549E1 = 1;
    v15 = dispatch_get_global_queue(21, 0);
    dispatch_async(v15, &stru_10030FE30);

    IOObjectRelease(v3);
    return 0;
  }
  if (byte_1003549D0)
    return 0;
LABEL_13:
  v0 = 4294967279;
LABEL_14:
  if (dword_1003549F0)
  {
    IOObjectRelease(dword_1003549F0);
    dword_1003549F0 = 0;
  }
  if (qword_1003549E8)
  {
    IONotificationPortDestroy((IONotificationPortRef)qword_1003549E8);
    qword_1003549E8 = 0;
  }
  if (dword_1003549BC)
  {
    IOServiceClose(dword_1003549BC);
    dword_1003549BC = 0;
  }
  return v0;
}

uint64_t SSEGetHostChallenge(CFDataRef *a1)
{
  uint64_t v2;
  uint64_t v3;
  CFDataRef v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  size_t v10;
  uint64_t inputStruct;
  uint64_t outputStruct;

  inputStruct = 0;
  outputStruct = 0;
  v10 = 0;
  if (a1)
  {
    v2 = sub_10026CC4C();
    if ((_DWORD)v2)
    {
      v8 = v2;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_10027164C();
    }
    else
    {
      LODWORD(inputStruct) = 1397966179;
      WORD2(inputStruct) = 2;
      v10 = 8;
      v3 = IOConnectCallStructMethod(dword_1003549BC, 0, &inputStruct, 8uLL, &outputStruct, &v10);
      if ((_DWORD)v3)
      {
        v8 = v3;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_1002715BC();
      }
      else if (v10 == 8)
      {
        v4 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)&outputStruct, 8);
        *a1 = v4;
        if (v4)
        {
          v8 = 0;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_10027149C();
          v8 = 4294967291;
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_10027152C();
        v8 = 4294967290;
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027140C();
    v8 = 4294967292;
  }
  sub_10026D204((uint64_t)"SSEGetHostChallenge", v8, 0, 0, 0, v5, v6, v7);
  return v8;
}

uint64_t sub_10026D204(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((_DWORD)a2 || (_DWORD)a3)
  {
    if (qword_100354A10)
    {
      sub_1002703B8("%s() -> %d", a2, a3, a4, a5, a6, a7, a8, result);
      return sub_1002704A0(a4, a5);
    }
  }
  return result;
}

uint64_t SSEAuthorizeAndSignECommerceBlob(const __CFData *a1, int a2, const __CFData *a3, char a4, const __CFData *a5, const __CFData *a6, const __CFData *a7, const __CFData *a8, const __CFData **a9)
{
  _DWORD *v17;
  _DWORD *v18;
  uint64_t v19;
  size_t v20;
  UInt8 *v21;
  uint64_t v22;
  CFIndex v23;
  const __CFData *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  UInt8 *outputStruct;
  size_t outputStructCnt;
  int v32;
  CFRange v33;
  CFRange v34;
  CFRange v35;
  CFRange v36;
  CFRange v37;
  CFRange v38;

  v32 = a2;
  outputStructCnt = 0;
  if (!a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1002716DC();
    goto LABEL_38;
  }
  if (!a3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027176C();
    goto LABEL_38;
  }
  if (!a5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1002717FC();
    goto LABEL_38;
  }
  if (!a6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027188C();
    goto LABEL_38;
  }
  if (!a7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027191C();
    goto LABEL_38;
  }
  if (!a8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1002719AC();
    goto LABEL_38;
  }
  if (!a9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100271A3C();
LABEL_38:
    v25 = 4294967292;
    goto LABEL_23;
  }
  v17 = malloc_type_calloc(0x4000uLL, 1uLL, 0x27E86296uLL);
  if (!v17)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100271ACC();
    goto LABEL_44;
  }
  v18 = v17;
  outputStruct = (UInt8 *)malloc_type_calloc(0x4000uLL, 1uLL, 0x1855B243uLL);
  if (!outputStruct)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100271B5C();
    free(v18);
LABEL_44:
    v25 = 4294967291;
    goto LABEL_23;
  }
  v19 = sub_10026CC4C();
  if ((_DWORD)v19)
  {
    v25 = v19;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027218C();
    goto LABEL_60;
  }
  *v18 = 1397966179;
  *((_WORD *)v18 + 2) = 15;
  if ((unint64_t)CFDataGetLength(a1) >= 0x41)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100271BEC();
    goto LABEL_59;
  }
  v33.length = CFDataGetLength(a1);
  v33.location = 0;
  CFDataGetBytes(a1, v33, (UInt8 *)v18 + 12);
  v18[2] = CFDataGetLength(a1);
  v18[19] = a2;
  if ((unint64_t)CFDataGetLength(a3) >= 0x19)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100271C7C();
    goto LABEL_59;
  }
  v34.length = CFDataGetLength(a3);
  v34.location = 0;
  CFDataGetBytes(a3, v34, (UInt8 *)v18 + 80);
  *((_BYTE *)v18 + 104) = a4;
  if (CFDataGetLength(a5) != 8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1002720FC();
    goto LABEL_59;
  }
  v35.length = CFDataGetLength(a5);
  v35.location = 0;
  CFDataGetBytes(a5, v35, (UInt8 *)v18 + 105);
  if (CFDataGetLength(a6) != 8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027206C();
    goto LABEL_59;
  }
  v36.length = CFDataGetLength(a6);
  v36.location = 0;
  CFDataGetBytes(a6, v36, (UInt8 *)v18 + 113);
  if (CFDataGetLength(a7) != 8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100271FDC();
    goto LABEL_59;
  }
  v37.length = CFDataGetLength(a7);
  v37.location = 0;
  CFDataGetBytes(a7, v37, (UInt8 *)v18 + 121);
  if ((unint64_t)CFDataGetLength(a8) >> 2 >= 0xFDD)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100271D0C();
LABEL_59:
    v25 = 4294967292;
LABEL_60:
    v21 = outputStruct;
    goto LABEL_22;
  }
  *(_DWORD *)((char *)v18 + 137) = CFDataGetLength(a8);
  v38.length = CFDataGetLength(a8);
  v38.location = 0;
  CFDataGetBytes(a8, v38, (UInt8 *)v18 + 141);
  *(_QWORD *)((char *)v18 + 129) = 0;
  v20 = *(unsigned int *)((char *)v18 + 137) + 141;
  outputStructCnt = 0x4000;
  v21 = outputStruct;
  v22 = IOConnectCallStructMethod(dword_1003549BC, 0, v18, v20, outputStruct, &outputStructCnt);
  if ((_DWORD)v22)
  {
    v25 = v22;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100271F4C();
    goto LABEL_22;
  }
  if (outputStructCnt <= 3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100271D9C();
  }
  else
  {
    v23 = *(unsigned int *)outputStruct;
    if (outputStructCnt == v23 + 4)
    {
      v24 = CFDataCreate(kCFAllocatorDefault, outputStruct + 4, v23);
      if (v24)
      {
        v25 = 0;
        *a9 = v24;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_100271E2C();
        v25 = 4294967291;
      }
      goto LABEL_22;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100271EBC();
  }
  v25 = 4294967290;
LABEL_22:
  free(v18);
  free(v21);
LABEL_23:
  sub_10026D204((uint64_t)"SSEAuthorizeAndSignECommerceBlob", v25, 0, (uint64_t)&v32, 0, v26, v27, v28);
  return v25;
}

uint64_t sub_10026D794()
{
  if (qword_100354A20 != -1)
    dispatch_once(&qword_100354A20, &stru_10030FEB0);
  if (qword_100354A18)
    return (uint64_t)_objc_msgSend((id)qword_100354A18, "prepare");
  else
    return 4294967290;
}

uint64_t sub_10026D7E4(int *a1, unint64_t a2, _QWORD *a3, _DWORD *a4)
{
  id v8;
  int v9;
  int v10;
  unsigned int *v11;
  _DWORD *v12;
  uint64_t v13;
  unsigned int v14;
  NSData *v15;
  uint64_t v16;

  v8 = +[NSMutableArray array](NSMutableArray, "array");
  if (!a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027221C();
    goto LABEL_32;
  }
  if (!a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1002722AC();
    goto LABEL_32;
  }
  if ((unint64_t)a1 > a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027233C();
    goto LABEL_32;
  }
  if (!a3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1002723CC();
    goto LABEL_32;
  }
  if (!a4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027245C();
LABEL_32:
    v16 = 4294967292;
    goto LABEL_16;
  }
  if ((unint64_t)a1 < a2)
  {
    if (a2 - (unint64_t)a1 <= 3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_1002724EC();
LABEL_21:
      v16 = 4294967290;
      goto LABEL_16;
    }
    v9 = *a1;
    if (*a1)
    {
      v10 = 0;
      v11 = (unsigned int *)(a1 + 1);
      while (a2 - (unint64_t)v11 > 3)
      {
        v14 = *v11;
        v12 = v11 + 1;
        v13 = v14;
        if ((uint64_t)(a2 - (_QWORD)v12) < v14)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_10027260C();
          goto LABEL_21;
        }
        v15 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v12, v13);
        objc_msgSend(v8, "addObject:", v15);

        v11 = (_DWORD *)((char *)v12 + v13);
        v10 += v13 + 4;
        if (!--v9)
          goto LABEL_15;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_10027257C();
      goto LABEL_21;
    }
  }
  v10 = 0;
LABEL_15:
  v16 = 0;
  *a3 = v8;
  *a4 = v10;
LABEL_16:

  return v16;
}

uint64_t SSEAuthorizeAndSignAPDU(int a1, const __CFData *a2, int a3, const __CFData *a4, const __CFData *a5, const __CFData *a6, const __CFData *a7, const __CFData *a8, CFDataRef *a9)
{
  UInt8 *v17;
  UInt8 *v18;
  uint64_t v19;
  size_t v20;
  UInt8 *v21;
  uint64_t v22;
  CFIndex v23;
  CFDataRef v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  UInt8 *outputStruct;
  size_t outputStructCnt;
  int v32;
  CFRange v33;
  CFRange v34;
  CFRange v35;
  CFRange v36;
  CFRange v37;
  CFRange v38;

  v32 = a3;
  outputStructCnt = 0;
  if (a1 != 8 && !a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027269C();
    goto LABEL_41;
  }
  if (!a4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027272C();
    goto LABEL_41;
  }
  if (!a5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1002727BC();
    goto LABEL_41;
  }
  if (!a6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027284C();
    goto LABEL_41;
  }
  if (!a7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1002728DC();
    goto LABEL_41;
  }
  if (!a8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027296C();
    goto LABEL_41;
  }
  if (!a9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1002729FC();
LABEL_41:
    v25 = 4294967292;
    goto LABEL_26;
  }
  v17 = (UInt8 *)malloc_type_calloc(0x4000uLL, 1uLL, 0xE7B35AA9uLL);
  if (!v17)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100272A8C();
    goto LABEL_47;
  }
  v18 = v17;
  outputStruct = (UInt8 *)malloc_type_calloc(0x4000uLL, 1uLL, 0x939AC92CuLL);
  if (!outputStruct)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100272B1C();
    free(v18);
LABEL_47:
    v25 = 4294967291;
    goto LABEL_26;
  }
  v19 = sub_10026CC4C();
  if ((_DWORD)v19)
  {
    v25 = v19;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027314C();
    goto LABEL_73;
  }
  *(_DWORD *)v18 = 1397966179;
  *((_WORD *)v18 + 2) = 31;
  *((_DWORD *)v18 + 2) = a1;
  if (a1 != 8)
  {
    if ((unint64_t)CFDataGetLength(a2) >= 0x41)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_1002730BC();
      goto LABEL_72;
    }
    v33.length = CFDataGetLength(a2);
    v33.location = 0;
    CFDataGetBytes(a2, v33, v18 + 16);
    *((_DWORD *)v18 + 3) = CFDataGetLength(a2);
  }
  *((_DWORD *)v18 + 20) = a3;
  if ((unint64_t)CFDataGetLength(a4) >= 0x19)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100272BAC();
    goto LABEL_72;
  }
  v34.length = CFDataGetLength(a4);
  v34.location = 0;
  CFDataGetBytes(a4, v34, v18 + 84);
  if (CFDataGetLength(a5) != 8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027302C();
    goto LABEL_72;
  }
  v35.length = CFDataGetLength(a5);
  v35.location = 0;
  CFDataGetBytes(a5, v35, v18 + 108);
  if (CFDataGetLength(a6) != 8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100272F9C();
    goto LABEL_72;
  }
  v36.length = CFDataGetLength(a6);
  v36.location = 0;
  CFDataGetBytes(a6, v36, v18 + 116);
  if (CFDataGetLength(a7) != 8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100272F0C();
    goto LABEL_72;
  }
  v37.length = CFDataGetLength(a7);
  v37.location = 0;
  CFDataGetBytes(a7, v37, v18 + 124);
  if ((unint64_t)CFDataGetLength(a8) >= 0x3F79)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100272C3C();
LABEL_72:
    v25 = 4294967292;
LABEL_73:
    v21 = outputStruct;
    goto LABEL_25;
  }
  *((_DWORD *)v18 + 33) = CFDataGetLength(a8);
  v38.length = CFDataGetLength(a8);
  v38.location = 0;
  CFDataGetBytes(a8, v38, v18 + 136);
  v20 = *((unsigned int *)v18 + 33) + 136;
  outputStructCnt = 0x4000;
  v21 = outputStruct;
  v22 = IOConnectCallStructMethod(dword_1003549BC, 0, v18, v20, outputStruct, &outputStructCnt);
  if ((_DWORD)v22)
  {
    v25 = v22;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100272E7C();
    goto LABEL_25;
  }
  if (outputStructCnt <= 3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100272CCC();
  }
  else
  {
    v23 = *(unsigned int *)outputStruct;
    if (outputStructCnt == v23 + 4)
    {
      v24 = CFDataCreate(kCFAllocatorDefault, outputStruct + 4, v23);
      if (v24)
      {
        v25 = 0;
        *a9 = v24;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_100272D5C();
        v25 = 4294967291;
      }
      goto LABEL_25;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100272DEC();
  }
  v25 = 4294967290;
LABEL_25:
  free(v18);
  free(v21);
LABEL_26:
  sub_10026D204((uint64_t)"SSEAuthorizeAndSignAPDU", v25, 0, (uint64_t)&v32, 0, v26, v27, v28);
  return v25;
}

uint64_t SSEGetSignedDeviceData(const __CFData *a1, CFDataRef *a2)
{
  uint64_t v4;
  uint64_t v5;
  CFDataRef v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  size_t outputStructCnt;
  _OWORD outputStruct[16];
  int v14;
  _DWORD inputStruct[8];
  uint64_t v16;
  CFRange v17;

  v16 = 0;
  memset(inputStruct, 0, sizeof(inputStruct));
  v14 = 0;
  memset(outputStruct, 0, sizeof(outputStruct));
  outputStructCnt = 0;
  if (!a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1002731DC();
    goto LABEL_19;
  }
  if (!a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027326C();
    goto LABEL_19;
  }
  v4 = sub_10026CC4C();
  if ((_DWORD)v4)
  {
    v10 = v4;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1002735CC();
    goto LABEL_10;
  }
  inputStruct[0] = 1397966179;
  LOWORD(inputStruct[1]) = 16;
  if ((unint64_t)CFDataGetLength(a1) >= 0x19)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1002732FC();
LABEL_19:
    v10 = 4294967292;
    goto LABEL_10;
  }
  v17.length = CFDataGetLength(a1);
  v17.location = 0;
  CFDataGetBytes(a1, v17, (UInt8 *)&inputStruct[2]);
  v16 = 0;
  outputStructCnt = 260;
  v5 = IOConnectCallStructMethod(dword_1003549BC, 0, inputStruct, 0x28uLL, outputStruct, &outputStructCnt);
  if (!(_DWORD)v5)
  {
    if (outputStructCnt <= 3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_10027338C();
    }
    else
    {
      if (outputStructCnt == LODWORD(outputStruct[0]) + 4)
      {
        v6 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)outputStruct + 4, LODWORD(outputStruct[0]));
        if (v6)
        {
          v10 = 0;
          *a2 = v6;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_10027341C();
          v10 = 4294967291;
        }
        goto LABEL_10;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_1002734AC();
    }
    v10 = 4294967290;
    goto LABEL_10;
  }
  v10 = v5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10027353C();
LABEL_10:
  sub_10026D204((uint64_t)"SSEGetSignedDeviceData", v10, 0, 0, (uint64_t)&inputStruct[2], v7, v8, v9);
  return v10;
}

uint64_t sub_10026E1BC()
{
  if (qword_100354A20 != -1)
    dispatch_once(&qword_100354A20, &stru_10030FEB0);
  if (qword_100354A18)
    return (uint64_t)_objc_msgSend((id)qword_100354A18, "issueNewCertificate");
  else
    return 4294967290;
}

uint64_t SSECreateSecureElementACLRequest(int a1, const __CFData *a2, const __CFData *a3, const __CFData *a4, const __CFData **a5, const __CFData **a6)
{
  UInt8 *v12;
  UInt8 *v13;
  UInt8 *v14;
  UInt8 *v15;
  uint64_t v16;
  unint64_t Length;
  unint64_t v18;
  unint64_t v19;
  UInt8 *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  size_t v24;
  unint64_t v25;
  CFDataRef v26;
  CFDataRef v27;
  CFIndex v28;
  const __CFData *v29;
  uint64_t v30;
  size_t outputStructCnt;
  CFRange v33;
  CFRange v34;
  CFRange v35;

  outputStructCnt = 0;
  if (!a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027365C();
    return 4294967292;
  }
  if (!a3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1002736EC();
    return 4294967292;
  }
  if (!a4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027377C();
    return 4294967292;
  }
  if (!a5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027380C();
    return 4294967292;
  }
  if (!a6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027389C();
    return 4294967292;
  }
  v12 = (UInt8 *)malloc_type_calloc(0x4000uLL, 1uLL, 0xDB9775F9uLL);
  if (!v12)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027392C();
    return 4294967291;
  }
  v13 = v12;
  v14 = (UInt8 *)malloc_type_calloc(0x4000uLL, 1uLL, 0x877EE47CuLL);
  if (!v14)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1002739BC();
    free(v13);
    return 4294967291;
  }
  v15 = v14;
  v16 = sub_10026CC4C();
  if ((_DWORD)v16)
  {
    v30 = v16;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100273FEC();
    goto LABEL_20;
  }
  *(_DWORD *)v13 = 1397966179;
  *((_WORD *)v13 + 2) = 26;
  *((_DWORD *)v13 + 2) = a1;
  Length = CFDataGetLength(a2);
  if (Length >= 0x19)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100273A4C();
    goto LABEL_47;
  }
  v33.length = Length;
  v33.location = 0;
  CFDataGetBytes(a2, v33, v13 + 12);
  v18 = CFDataGetLength(a3);
  if (v18 >= 0x3FD5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100273ADC();
    goto LABEL_47;
  }
  v19 = v18;
  *((_DWORD *)v13 + 9) = v18;
  v34.location = 0;
  v34.length = v18;
  CFDataGetBytes(a3, v34, v13 + 44);
  v20 = &v13[v19 + 44];
  v21 = CFDataGetLength(a4);
  if (v13 - v20 + 0x4000 < v21)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100273B6C();
LABEL_47:
    v30 = 4294967292;
    goto LABEL_20;
  }
  v22 = v21;
  *((_DWORD *)v13 + 10) = v21;
  v35.location = 0;
  v35.length = v21;
  CFDataGetBytes(a4, v35, v20);
  outputStructCnt = 0x4000;
  v23 = IOConnectCallStructMethod(dword_1003549BC, 0, v13, &v20[v22] - v13, v15, &outputStructCnt);
  if ((_DWORD)v23)
  {
    v30 = v23;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100273F5C();
    goto LABEL_20;
  }
  v24 = outputStructCnt;
  if (outputStructCnt <= 7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100273BFC();
    goto LABEL_56;
  }
  if (outputStructCnt > 0x4000)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100273C8C();
    goto LABEL_56;
  }
  v25 = *(unsigned int *)v15;
  if (outputStructCnt - 8 < v25)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100273D1C();
LABEL_56:
    v30 = 4294967290;
    goto LABEL_20;
  }
  v26 = CFDataCreate(kCFAllocatorDefault, v15 + 8, v25);
  if (!v26)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100273DAC();
    v30 = 4294967291;
    goto LABEL_20;
  }
  v27 = v26;
  v28 = *((unsigned int *)v15 + 1);
  if ((uint64_t)(v24 - (*(unsigned int *)v15 + 8)) < v28)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100273E3C();
    v30 = 4294967290;
    goto LABEL_66;
  }
  v29 = CFDataCreate(kCFAllocatorDefault, &v15[*(unsigned int *)v15 + 8], v28);
  if (!v29)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100273ECC();
    v30 = 4294967291;
LABEL_66:
    CFRelease(v27);
    goto LABEL_20;
  }
  v30 = 0;
  *a5 = v27;
  *a6 = v29;
LABEL_20:
  free(v13);
  free(v15);
  return v30;
}

uint64_t SSEEvaluateSecureElementACL(const __CFData *a1, int a2, const __CFData *a3, const __CFData *a4, const __CFData *a5, const __CFString *a6, const __CFData *a7, unsigned int a8, const __CFData **a9, const __CFData **a10)
{
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  unint64_t Length;
  int v23;
  unint64_t v24;
  char *v25;
  UInt8 *v26;
  unint64_t v27;
  unint64_t v28;
  UInt8 *v29;
  unint64_t v30;
  unint64_t v31;
  UInt8 *v32;
  unint64_t v33;
  unint64_t v34;
  UInt8 *v35;
  unint64_t v36;
  unint64_t v37;
  UInt8 *v38;
  uint64_t v39;
  size_t v40;
  unint64_t v41;
  CFDataRef v42;
  const __CFData *v43;
  CFIndex v44;
  const __CFData *v45;
  uint64_t v46;
  UInt8 *outputStruct;
  size_t outputStructCnt;
  CFRange v50;
  CFRange v51;
  CFRange v52;
  CFRange v53;
  CFRange v54;
  CFRange v55;

  outputStructCnt = 0;
  if (!a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027407C();
    return 4294967292;
  }
  if (!a3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027410C();
    return 4294967292;
  }
  if (!a4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027419C();
    return 4294967292;
  }
  if (!a5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027422C();
    return 4294967292;
  }
  if (!a6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1002742BC();
    return 4294967292;
  }
  if (!a7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027434C();
    return 4294967292;
  }
  if (a8 - 4 <= 0xFFFFFFFC)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1002743DC();
    return 4294967292;
  }
  if (!a9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027446C();
    return 4294967292;
  }
  if (!a10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1002744FC();
    return 4294967292;
  }
  if (a8 < 2 || (v18 = SSEIsFeatureSupported(32), !(_DWORD)v18))
  {
    v19 = (char *)malloc_type_calloc(0x4000uLL, 1uLL, 0x29CD736uLL);
    if (v19)
    {
      v20 = v19;
      outputStruct = (UInt8 *)malloc_type_calloc(0x4000uLL, 1uLL, 0xAE84491FuLL);
      if (outputStruct)
      {
        v21 = sub_10026CC4C();
        if ((_DWORD)v21)
        {
          v46 = v21;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_100274E8C();
          goto LABEL_73;
        }
        *(_DWORD *)v20 = 1397966179;
        v20[4] = 27;
        v20[5] = a8 > 1;
        Length = CFDataGetLength(a1);
        if (Length >= 0x41)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_1002746AC();
        }
        else
        {
          v23 = Length;
          v50.location = 0;
          v50.length = Length;
          CFDataGetBytes(a1, v50, (UInt8 *)v20 + 12);
          *((_DWORD *)v20 + 2) = v23;
          *((_DWORD *)v20 + 19) = a2;
          v24 = CFDataGetLength(a3);
          if (v24 >= 0x19)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              sub_10027473C();
          }
          else
          {
            v51.length = v24;
            v51.location = 0;
            CFDataGetBytes(a3, v51, (UInt8 *)v20 + 80);
            v25 = v20 + 0x4000;
            if (a8 < 2)
            {
              v26 = (UInt8 *)(v20 + 120);
            }
            else
            {
              v20[120] = a8;
              v26 = (UInt8 *)(v20 + 121);
            }
            v27 = CFDataGetLength(a4);
            if (v25 - (char *)v26 < v27)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                sub_1002747CC();
            }
            else
            {
              v28 = v27;
              *((_DWORD *)v20 + 26) = v27;
              v52.location = 0;
              v52.length = v27;
              CFDataGetBytes(a4, v52, v26);
              v29 = &v26[v28];
              v30 = CFDataGetLength(a5);
              if (v25 - (char *)v29 < v30)
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                  sub_10027485C();
              }
              else
              {
                v31 = v30;
                *((_DWORD *)v20 + 27) = v30;
                v53.location = 0;
                v53.length = v30;
                CFDataGetBytes(a5, v53, v29);
                v32 = &v29[v31];
                v33 = CFStringGetLength(a6);
                if (v25 - (char *)v32 >= v33)
                {
                  v34 = v33;
                  v54.location = 0;
                  v54.length = v33;
                  if (CFStringGetBytes(a6, v54, 0x8000100u, 0, 0, v32, v25 - (char *)v32, 0) == v33)
                  {
                    *((_DWORD *)v20 + 28) = v34;
                    v35 = &v32[v34];
                    v36 = CFDataGetLength(a7);
                    if (v25 - (char *)v35 < v36)
                    {
                      v38 = outputStruct;
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                        sub_10027497C();
                      v46 = 4294967292;
                      goto LABEL_33;
                    }
                    v37 = v36;
                    *((_DWORD *)v20 + 29) = v36;
                    v55.location = 0;
                    v55.length = v36;
                    CFDataGetBytes(a7, v55, v35);
                    outputStructCnt = 0x4000;
                    v38 = outputStruct;
                    v39 = IOConnectCallStructMethod(dword_1003549BC, 0, v20, &v35[v37] - (UInt8 *)v20, outputStruct, &outputStructCnt);
                    if ((_DWORD)v39)
                    {
                      v46 = v39;
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                        sub_100274D6C();
                      goto LABEL_33;
                    }
                    v40 = outputStructCnt;
                    if (outputStructCnt <= 7)
                    {
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                        sub_100274A0C();
                    }
                    else if (outputStructCnt > 0x4000)
                    {
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                        sub_100274A9C();
                    }
                    else
                    {
                      v41 = *(unsigned int *)outputStruct;
                      if (outputStructCnt - 8 >= v41)
                      {
                        v42 = CFDataCreate(kCFAllocatorDefault, outputStruct + 8, v41);
                        if (!v42)
                        {
                          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                            sub_100274BBC();
                          v46 = 4294967291;
                          goto LABEL_33;
                        }
                        v43 = v42;
                        v44 = *((unsigned int *)outputStruct + 1);
                        if ((uint64_t)(v40 - (*(unsigned int *)outputStruct + 8)) < v44)
                        {
                          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                            sub_100274C4C();
                          v46 = 4294967290;
                        }
                        else
                        {
                          v45 = CFDataCreate(kCFAllocatorDefault, &outputStruct[*(unsigned int *)outputStruct + 8], v44);
                          if (v45)
                          {
                            v46 = 0;
                            *a9 = v43;
                            *a10 = v45;
LABEL_33:
                            free(v20);
                            free(v38);
                            return v46;
                          }
                          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                            sub_100274CDC();
                          v46 = 4294967291;
                        }
                        CFRelease(v43);
                        goto LABEL_33;
                      }
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                        sub_100274B2C();
                    }
                    v46 = 4294967290;
                    goto LABEL_33;
                  }
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                    sub_100274DFC();
                  v46 = 4294967290;
LABEL_73:
                  v38 = outputStruct;
                  goto LABEL_33;
                }
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                  sub_1002748EC();
              }
            }
          }
        }
        v46 = 4294967292;
        goto LABEL_73;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_10027461C();
      free(v20);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10027458C();
    }
    return 4294967291;
  }
  v46 = v18;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100274F1C();
  return v46;
}

uint64_t sub_10026ED1C(const __CFData *a1, const __CFData *a2, const __CFData *a3, const __CFData *a4, const __CFData *a5, CFDataRef *a6)
{
  _DWORD *v12;
  _DWORD *v13;
  UInt8 *v14;
  UInt8 *v15;
  uint64_t v16;
  unint64_t Length;
  NSMutableData *v18;
  NSMutableData *v19;
  unint64_t v20;
  unsigned int v21;
  NSMutableData *v22;
  uint64_t v23;
  CFIndex v24;
  CFDataRef v25;
  uint64_t v26;
  CFDataRef *v28;
  size_t outputStructCnt;
  UInt8 buffer[16];
  __int128 v31;
  uint64_t v32;
  CFRange v33;

  outputStructCnt = 0;
  v32 = 0;
  *(_OWORD *)buffer = 0u;
  v31 = 0u;
  if (!a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100274FAC();
    goto LABEL_54;
  }
  if (!a6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027503C();
LABEL_54:
    v19 = 0;
    v26 = 4294967292;
    goto LABEL_42;
  }
  v12 = malloc_type_calloc(0x4000uLL, 1uLL, 0xAA037781uLL);
  if (!v12)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1002750CC();
    goto LABEL_60;
  }
  v13 = v12;
  v14 = (UInt8 *)malloc_type_calloc(0x4000uLL, 1uLL, 0xE079FC04uLL);
  if (!v14)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027515C();
    free(v13);
LABEL_60:
    v19 = 0;
    v26 = 4294967291;
    goto LABEL_42;
  }
  v15 = v14;
  v16 = sub_10026CC4C();
  if ((_DWORD)v16)
  {
    v26 = v16;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1002758B0();
    v19 = 0;
    goto LABEL_41;
  }
  Length = CFDataGetLength(a1);
  if (Length >= 0x19)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1002751EC();
    goto LABEL_83;
  }
  v33.length = Length;
  v33.location = 0;
  CFDataGetBytes(a1, v33, buffer);
  if (a2)
  {
    if (CFDataGetLength(a2) >= (uint64_t)&_mh_execute_header)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100275820();
      goto LABEL_83;
    }
    DWORD2(v31) = CFDataGetLength(a2);
  }
  if (a3)
  {
    if (CFDataGetLength(a3) >= (uint64_t)&_mh_execute_header)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100275790();
      goto LABEL_83;
    }
    HIDWORD(v31) = CFDataGetLength(a3);
  }
  if (a4)
  {
    if (CFDataGetLength(a4) >= (uint64_t)&_mh_execute_header)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100275700();
      goto LABEL_83;
    }
    LODWORD(v32) = CFDataGetLength(a4);
  }
  if (!a5)
  {
LABEL_19:
    v18 = +[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", buffer, 40);
    v19 = v18;
    if (a2)
      -[NSMutableData appendData:](v18, "appendData:", a2);
    if (a3)
      -[NSMutableData appendData:](v19, "appendData:", a3);
    if (a4)
      -[NSMutableData appendData:](v19, "appendData:", a4);
    if (a5)
      -[NSMutableData appendData:](v19, "appendData:", a5);
    if (!(-[NSMutableData length](v19, "length") >> 32))
    {
      v28 = a6;
      LODWORD(v20) = 0;
      while (1)
      {
        *v13 = 1397966179;
        *((_WORD *)v13 + 2) = 29;
        v21 = (-[NSMutableData length](v19, "length", v28, outputStructCnt, *(_QWORD *)buffer, *(_QWORD *)&buffer[8], v31, v32)- v20) >> 2 > 0xFFA? 16364: -[NSMutableData length](v19, "length") - v20;
        v13[2] = -[NSMutableData length](v19, "length");
        v13[3] = v20;
        v13[4] = v21;
        v22 = objc_retainAutorelease(v19);
        __memcpy_chk(v13 + 5, (char *)-[NSMutableData bytes](v22, "bytes") + v20, v21, 16364);
        outputStructCnt = 0x4000;
        v23 = IOConnectCallStructMethod(dword_1003549BC, 0, v13, v21 + 20, v15, &outputStructCnt);
        if ((_DWORD)v23)
          break;
        if (outputStructCnt <= 3)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_10027530C();
          goto LABEL_49;
        }
        if (outputStructCnt > 0x4000)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_10027539C();
          goto LABEL_49;
        }
        v20 = v20 + v21;
        if (-[NSMutableData length](v22, "length") <= v20)
        {
          if (outputStructCnt <= 3)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              sub_10027542C();
          }
          else
          {
            v24 = *(unsigned int *)v15;
            if (outputStructCnt - 4 == v24)
            {
              v25 = CFDataCreate(kCFAllocatorDefault, v15 + 4, v24);
              if (v25)
              {
                v26 = 0;
                *v28 = v25;
              }
              else
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                  sub_1002754BC();
                v26 = 4294967291;
              }
              goto LABEL_40;
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              sub_10027554C();
          }
LABEL_49:
          v26 = 4294967290;
          goto LABEL_40;
        }
      }
      v26 = v23;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_1002755DC();
LABEL_40:
      v19 = v22;
      goto LABEL_41;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10027527C();
    goto LABEL_84;
  }
  if (CFDataGetLength(a5) < (uint64_t)&_mh_execute_header)
  {
    HIDWORD(v32) = CFDataGetLength(a5);
    goto LABEL_19;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100275670();
LABEL_83:
  v19 = 0;
LABEL_84:
  v26 = 4294967292;
LABEL_41:
  free(v13);
  free(v15);
LABEL_42:

  return v26;
}

uint64_t SSEGetRosePairingInfo(const __CFData *a1, const __CFData *a2, const __CFData *a3, const __CFData *a4, const __CFData *a5, const __CFData **a6)
{
  uint64_t v6;

  if (!a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100275940();
    return 4294967292;
  }
  if (!a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1002759D0();
    return 4294967292;
  }
  if (!a5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100275A60();
    return 4294967292;
  }
  if (!a6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100275AF0();
    return 4294967292;
  }
  v6 = sub_10026ED1C(a1, a2, a3, a4, a5, a6);
  if ((_DWORD)v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100275B80();
  return v6;
}

uint64_t SSEEvaluateSecureElementACL(const __CFData *a1, const __CFData *a2, const __CFData *a3, const __CFData *a4, const __CFString *a5, const __CFData *a6, unsigned int a7, const __CFData **a8, const __CFData **a9)
{
  return SSEEvaluateSecureElementACL(a1, -1, a2, a3, a4, a5, a6, a7, a8, a9);
}

void sub_100270094(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  NSObject *v5;
  NSObject *v6;
  _QWORD *v7;
  NSObject *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  if (a3 == -469794813)
  {
    v5 = (id)qword_1003549C8;
    v6 = v5;
    if (!v5)
      v6 = dispatch_get_global_queue(21, 0);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100270398;
    v9[3] = &unk_100304448;
    v9[4] = a4;
    v7 = v9;
    goto LABEL_10;
  }
  if (a3 == -469794814)
  {
    if (!byte_100354F49)
    {
      v8 = dispatch_get_global_queue(21, 0);
      dispatch_async(v8, &stru_10030FE90);

    }
    goto LABEL_14;
  }
  if (a3 != -469794815)
  {
LABEL_14:
    v5 = 0;
    goto LABEL_15;
  }
  v5 = (id)qword_1003549C0;
  v6 = v5;
  if (!v5)
    v6 = dispatch_get_global_queue(21, 0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100270374;
  v10[3] = &unk_100304448;
  v10[4] = a4;
  v7 = v10;
LABEL_10:
  dispatch_async(v6, v7);
  if (!v5)

LABEL_15:
}

void sub_10027021C(id a1)
{
  char *v1;
  char *__lasts;
  size_t v3;
  char __str[1024];

  v3 = 1024;
  if (!sysctlbyname("kern.bootargs", __str, &v3, 0, 0))
  {
    __lasts = 0;
    v1 = strtok_r(__str, " \t", &__lasts);
    if (v1)
    {
      while (strcmp(v1, "rd=md0"))
      {
        v1 = strtok_r(0, " \t", &__lasts);
        if (!v1)
          return;
      }
      byte_1003549F4 = 1;
    }
  }
}

void sub_1002702F8(id a1)
{
  void *v1;
  void *v2;
  uint64_t (*v3)(const __CFString *);
  uint64_t (*v4)(const __CFString *);

  v1 = dlopen("/usr/lib/libMobileGestalt.dylib", 1);
  if (v1)
  {
    v2 = v1;
    v3 = (uint64_t (*)(const __CFString *))dlsym(v1, "MGGetBoolAnswer");
    if (v3)
    {
      v4 = v3;
      byte_100354A00 = v3(CFSTR("0dnM19zBqLw5ZPhIo4GEkg"));
      byte_100354A01 = v4(CFSTR("InternalBuild"));
    }
    dlclose(v2);
  }
}

uint64_t sub_100270374()
{
  uint64_t result;

  result = qword_1003549A8;
  if (qword_1003549A8)
    return (*(uint64_t (**)(void))(qword_1003549A8 + 16))();
  return result;
}

uint64_t sub_100270398()
{
  uint64_t result;

  result = qword_1003549B0;
  if (qword_1003549B0)
    return (*(uint64_t (**)(void))(qword_1003549B0 + 16))();
  return result;
}

const char *sub_1002703B8(const char *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  const char *v9;
  tm *v10;
  FILE *v11;
  const char *v12;
  time_t v13;
  char v14[16];
  __int128 v15;

  if (qword_100354A10)
  {
    v9 = result;
    *(_OWORD *)v14 = 0u;
    v15 = 0u;
    v13 = time(0);
    v10 = localtime(&v13);
    strftime(v14, 0x20uLL, "%F %T (%z)", v10);
    v11 = (FILE *)qword_100354A10;
    v12 = getprogname();
    fprintf(v11, "%s [%s]: ", v14, v12);
    vfprintf((FILE *)qword_100354A10, v9, &a9);
    fputs("\n", (FILE *)qword_100354A10);
    return (const char *)fflush((FILE *)qword_100354A10);
  }
  return result;
}

uint64_t sub_1002704A0(uint64_t result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t i;
  size_t outputStructCnt;
  __int128 outputStruct;
  __int128 v7;
  __int128 v8;
  uint64_t inputStruct;

  if (qword_100354A10)
  {
    v3 = (_DWORD *)result;
    inputStruct = 0x953534563;
    v7 = 0u;
    v8 = 0u;
    outputStruct = 0u;
    outputStructCnt = 48;
    result = IOConnectCallStructMethod(dword_1003549BC, 0, &inputStruct, 8uLL, &outputStruct, &outputStructCnt);
    if (!(_DWORD)result)
    {
      if (v3)
        fprintf((FILE *)qword_100354A10, "\tuserID        = %u\n", *v3);
      if (a2)
      {
        fwrite("\tseid          = ", 0x11uLL, 1uLL, (FILE *)qword_100354A10);
        for (i = 0; i != 24; ++i)
          fprintf((FILE *)qword_100354A10, "%02x", *(unsigned __int8 *)(a2 + i));
        fputs("\n", (FILE *)qword_100354A10);
      }
      fprintf((FILE *)qword_100354A10, "\tsseKey hash   = %016llx\n", (_QWORD)outputStruct);
      fprintf((FILE *)qword_100354A10, "\tauthRand hash = %016llx\n", *((_QWORD *)&outputStruct + 1));
      fprintf((FILE *)qword_100354A10, "\tsubcounter    = %llu\n", (_QWORD)v7);
      fprintf((FILE *)qword_100354A10, "\tentropy hash  = %016llx\n", *((_QWORD *)&v7 + 1));
      fprintf((FILE *)qword_100354A10, "\tkeybag hash   = %016llx\n", (_QWORD)v8);
      fprintf((FILE *)qword_100354A10, "\tnoPasscodeCnt = %u\n", DWORD2(v8));
      return fflush((FILE *)qword_100354A10);
    }
  }
  return result;
}

void sub_100270630(id a1)
{
  Class Class;

  if (qword_1003549F8 != -1)
    dispatch_once(&qword_1003549F8, &stru_10030FE50);
  if ((byte_1003549F4 & 1) == 0)
  {
    sub_10026CC4C();
    if (byte_1003549D0)
    {
      if (qword_100354A30 != -1)
        dispatch_once(&qword_100354A30, &stru_10030FED0);
      if (byte_100354A28 == 1)
      {
        if (dlopen("/usr/lib/libAppleSSEExt.dylib", 1))
        {
          Class = objc_getClass("BAASupport");
          qword_100354A18 = (uint64_t)Class;
          if (!Class)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              sub_100276FC0();
            Class = (Class)qword_100354A18;
          }
          -[objc_class setDelegate:](Class, "setDelegate:", objc_opt_class(BAADelegateImpl));
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_100276F30();
        }
      }
    }
  }
}

void sub_100270750(id a1)
{
  NSProcessInfo *v1;
  NSString *v2;
  unsigned int v3;
  void *v4;
  void *v5;
  uint64_t (*v6)(const CFAllocatorRef);
  uint64_t v7;
  const void *v8;
  uint64_t (*v9)(const void *, const __CFString *, _QWORD);
  uint64_t (*v10)(const void *, const __CFString *, _QWORD);
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _DWORD v15[2];

  v1 = +[NSProcessInfo processInfo](NSProcessInfo, "processInfo");
  v2 = -[NSProcessInfo processName](v1, "processName");
  v3 = -[NSString isEqualToString:](v2, "isEqualToString:", CFSTR("nfcd"));

  if (v3)
  {
    byte_100354A28 = 1;
  }
  else
  {
    v4 = dlopen("/System/Library/Frameworks/Security.framework/Security", 1);
    if (v4)
    {
      v5 = v4;
      v6 = (uint64_t (*)(const CFAllocatorRef))dlsym(v4, "SecTaskCreateFromSelf");
      if (v6)
      {
        v7 = v6(kCFAllocatorDefault);
        if (v7)
        {
          v8 = (const void *)v7;
          v9 = (uint64_t (*)(const void *, const __CFString *, _QWORD))dlsym(v5, "SecTaskCopyValueForEntitlement");
          if (v9)
          {
            v10 = v9;
            v11 = (void *)v9(v8, CFSTR("com.apple.private.applesse.allow"), 0);
            v12 = (void *)v10(v8, CFSTR("com.apple.private.applesse.baa"), 0);
            v13 = objc_opt_class(NSNumber);
            if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
            {
              if (objc_msgSend(v11, "BOOLValue"))
              {
                v14 = objc_opt_class(NSNumber);
                if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0)
                {
                  if (objc_msgSend(v12, "BOOLValue"))
                    byte_100354A28 = 1;
                }
              }
            }

          }
          CFRelease(v8);
        }
      }
      dlclose(v5);
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109120;
    v15[1] = byte_100354A28;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "isEntitledForBAA(): entitled = %u", (uint8_t *)v15, 8u);
  }
}

void sub_100270980(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x30u);
}

void sub_1002709EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100270A7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100270B0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100270B9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100270C2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100270CBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100270D4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100270DDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100270E6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100270EFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100270F8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027101C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002710AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027113C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002711CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027125C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002712EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027137C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027140C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027149C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027152C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002715BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027164C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002716DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027176C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002717FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027188C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027191C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002719AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100271A3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100271ACC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100271B5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100271BEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100271C7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100271D0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100271D9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100271E2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100271EBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100271F4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100271FDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027206C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002720FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027218C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027221C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002722AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027233C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002723CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027245C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002724EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027257C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027260C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027269C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027272C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002727BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027284C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002728DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027296C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002729FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100272A8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100272B1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100272BAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100272C3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100272CCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100272D5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100272DEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100272E7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100272F0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100272F9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027302C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002730BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027314C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002731DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027326C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002732FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027338C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027341C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002734AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027353C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002735CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027365C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002736EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027377C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027380C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027389C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027392C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002739BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100273A4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100273ADC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100273B6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100273BFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100273C8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100273D1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100273DAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100273E3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100273ECC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100273F5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100273FEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027407C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027410C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027419C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027422C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002742BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027434C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002743DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027446C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002744FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027458C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027461C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002746AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027473C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002747CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027485C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002748EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027497C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100274A0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100274A9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100274B2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100274BBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100274C4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100274CDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100274D6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100274DFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100274E8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100274F1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100274FAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027503C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002750CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027515C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002751EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027527C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027530C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027539C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027542C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002754BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_10027554C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002755DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1002709CC();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, 2u);
  sub_1002709C4();
}

void sub_100275670()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100275700()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100275790()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100275820()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002758B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100275940()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002759D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100275A60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100275AF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100275B80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100275C10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100275CA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100275D30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100275DC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100275E50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100275EE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100275F70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100276000()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100276090()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100276120()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002761B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100276240()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002762D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100276360()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002763F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100276480()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100276510()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002765A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100276630()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002766C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100276750()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_1002767E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100276870()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100276900()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100276990()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100276A20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100276AB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100276B40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100276BD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100276C60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100276CF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100276D80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100276E10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100276EA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1002709A4();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100276F30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

void sub_100276FC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100270960();
  sub_100270990();
  sub_100270980((void *)&_mh_execute_header, &_os_log_default, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
  sub_1002709C4();
}

uint64_t sub_100277050()
{
  return sub_1002771E8(1);
}

uint64_t sub_100277058(int a1, int a2, int a3, int a4)
{
  BOOL v9;
  _DWORD v10[2];

  if (qword_100354A50 == -1)
  {
    if (qword_100354A58)
    {
LABEL_3:
      v10[0] = a1;
      v10[1] = (a2 << 16) | (a3 << 8) | a4;
      return _availability_version_check(1, v10);
    }
  }
  else
  {
    dispatch_once_f(&qword_100354A50, 0, (dispatch_function_t)sub_1002771E0);
    if (qword_100354A58)
      goto LABEL_3;
  }
  if (qword_100354A48 == -1)
  {
    v9 = dword_100354A38 < a2;
    if (dword_100354A38 > a2)
      return 1;
  }
  else
  {
    dispatch_once_f(&qword_100354A48, 0, (dispatch_function_t)sub_100277050);
    v9 = dword_100354A38 < a2;
    if (dword_100354A38 > a2)
      return 1;
  }
  if (v9)
    return 0;
  if (dword_100354A3C > a3)
    return 1;
  return dword_100354A3C >= a3 && dword_100354A40 >= a4;
}

uint64_t sub_1002771E0()
{
  return sub_1002771E8(0);
}

uint64_t sub_1002771E8(uint64_t result)
{
  void *v1;
  BOOL v2;
  unsigned __int8 *v4;
  uint64_t (*v5)(_QWORD);
  unint64_t v6;
  uint64_t (*v7)(_QWORD, uint64_t, _QWORD, _QWORD);
  uint64_t (*v8)(_QWORD, const char *, uint64_t, unsigned __int8 *);
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t (*v10)(uint64_t);
  uint64_t (*v11)(void);
  FILE *v12;
  FILE *v13;
  uint64_t v14;
  size_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  FILE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  FILE *v27;
  unsigned int (*v28)(uint64_t, char *, uint64_t, uint64_t);
  char v29[32];

  v1 = (void *)qword_100354A58;
  if (qword_100354A58)
    v2 = (_DWORD)result == 0;
  else
    v2 = 0;
  if (!v2)
  {
    if (&__availability_version_check)
    {
      qword_100354A58 = (uint64_t)&__availability_version_check;
      v1 = &__availability_version_check;
    }
    if (!v1 || (_DWORD)result != 0)
    {
      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        v4 = *(unsigned __int8 **)result;
        result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          v5 = (uint64_t (*)(_QWORD))result;
          v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            v7 = (uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD))result;
            result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              v8 = (uint64_t (*)(_QWORD, const char *, uint64_t, unsigned __int8 *))result;
              result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  v10 = (uint64_t (*)(uint64_t))result;
                  result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    v11 = (uint64_t (*)(void))result;
                    result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        v12 = (FILE *)result;
                        result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          v13 = (FILE *)result;
                          v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          v14 = ftell(v13);
                          if (v14 < 0)
                          {
                            v16 = 0;
                          }
                          else
                          {
                            v15 = v14;
                            rewind(v13);
                            v16 = malloc(v15);
                            if (v16)
                            {
                              v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                v17 = v5(0);
                                if (v17)
                                {
                                  v18 = v17;
                                  v19 = v13;
                                  if (v6)
                                    v20 = ((uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD))v6)(0, v17, 0, 0, 0);
                                  else
                                    v20 = v7(0, v17, 0, 0);
                                  v21 = v20;
                                  if (v20)
                                  {
                                    v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      v23 = v22;
                                      v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984))
                                            sscanf(v29, "%d.%d.%d", &dword_100354A38, &dword_100354A3C, &dword_100354A40);
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  v19 = v13;
                                }
                                v16 = v26;
                              }
                              else
                              {
                                v16 = v26;
                                v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_100277518(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;

  v2 = *a1;
  v3 = sub_10003407C(*(id *)(a2 + 48), (const char *)a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = 138412546;
  v6 = v2;
  v7 = 2112;
  v8 = v4;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Selecting endpoint by name instead of PKID %@ client %@", (uint8_t *)&v5, 0x16u);

}

void sub_1002775C0(NSObject *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (sub_1000489C0(a1))
    sub_100048994((void *)&_mh_execute_header, v1, v2, v3, "PTA_CREATE_ENDPOINT", "", v4, v5, 0);
  sub_1000489B4();
}

void sub_100277600(NSObject *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (sub_1000489C0(a1))
    sub_100048994((void *)&_mh_execute_header, v1, v2, v3, "PTA_DELETE_ENDPOINT", "", v4, v5, 0);
  sub_1000489B4();
}

void sub_100277640(NSObject *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (sub_1000489C0(a1))
    sub_100048994((void *)&_mh_execute_header, v1, v2, v3, "PTA_CREATE_ENDPOINTCA", "", v4, v5, 0);
  sub_1000489B4();
}

void sub_100277680(NSObject *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (sub_1000489C0(a1))
    sub_100048994((void *)&_mh_execute_header, v1, v2, v3, "PTA_DELETE_ENDPOINTCA", "", v4, v5, 0);
  sub_1000489B4();
}

id objc_msgSend_AID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "AID");
}

id objc_msgSend_CKKSControlObject_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CKKSControlObject:error:");
}

id objc_msgSend_DERItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "DERItem");
}

id objc_msgSend_HTTPBody(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "HTTPBody");
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_KEnc(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "KEnc");
}

id objc_msgSend_KMac(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "KMac");
}

id objc_msgSend_KRMac(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "KRMac");
}

id objc_msgSend_Kble_intro(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "Kble_intro");
}

id objc_msgSend_Kble_oob_master(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "Kble_oob_master");
}

id objc_msgSend_M2(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "M2");
}

id objc_msgSend_PerformSEABAAWithAttestation_casdCertificate_nonce_OIDs_validityInterval_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "PerformSEABAAWithAttestation:casdCertificate:nonce:OIDs:validityInterval:error:");
}

id objc_msgSend_PerformScriptWithName_seHandle_logSink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "PerformScriptWithName:seHandle:logSink:");
}

id objc_msgSend_PerformScriptWithName_sefwPath_seHandle_logSink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "PerformScriptWithName:sefwPath:seHandle:logSink:");
}

id objc_msgSend_SymmetricLTS(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "SymmetricLTS");
}

id objc_msgSend_TLVWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "TLVWithData:");
}

id objc_msgSend_TLVWithTag_children_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "TLVWithTag:children:");
}

id objc_msgSend_TLVWithTag_fromData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "TLVWithTag:fromData:");
}

id objc_msgSend_TLVWithTag_unsignedChar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "TLVWithTag:unsignedChar:");
}

id objc_msgSend_TLVWithTag_unsignedShort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "TLVWithTag:unsignedShort:");
}

id objc_msgSend_TLVWithTag_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "TLVWithTag:value:");
}

id objc_msgSend_TLVsWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "TLVsWithData:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__acl_containsOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_acl:containsOperation:");
}

id objc_msgSend__appearsToBeEmail(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appearsToBeEmail");
}

id objc_msgSend__appearsToBePhoneNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appearsToBePhoneNumber");
}

id objc_msgSend__applyConfidentialMailboxContents_secureElement_instanceAID_keyIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applyConfidentialMailboxContents:secureElement:instanceAID:keyIdentifier:");
}

id objc_msgSend__applyPrivateMailboxContents_secureElement_instanceAID_keyIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applyPrivateMailboxContents:secureElement:instanceAID:keyIdentifier:");
}

id objc_msgSend__createEndPointCA_database_clientName_identifier_subjectIdentifier_forEndPointType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createEndPointCA:database:clientName:identifier:subjectIdentifier:forEndPointType:error:");
}

id objc_msgSend__createKey_acl_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createKey:acl:error:");
}

id objc_msgSend__createSynchronizableKey_extractedACLs_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createSynchronizableKey:extractedACLs:error:");
}

id objc_msgSend__debugGetReaderIdentifiersForAllEndpoints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_debugGetReaderIdentifiersForAllEndpoints:");
}

id objc_msgSend__deleteLoadedKey_instanceAID_loadedKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deleteLoadedKey:instanceAID:loadedKey:error:");
}

id objc_msgSend__ensureCAExistsAndValid_clientName_secureElement_database_forEndPointType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_ensureCAExistsAndValid:clientName:secureElement:database:forEndPointType:error:");
}

id objc_msgSend__existsDuplicateInDatabase_airInstanceEntity_withIdentifier_orReaderIdentifier_outError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_existsDuplicateInDatabase:airInstanceEntity:withIdentifier:orReaderIdentifier:outError:");
}

id objc_msgSend__extractedACLForFidoKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractedACLForFidoKey");
}

id objc_msgSend__getBAACertificatesForKey_key_subjectIdentifier_nonce_OIDs_validityInterval_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getBAACertificatesForKey:key:subjectIdentifier:nonce:OIDs:validityInterval:error:");
}

id objc_msgSend__getEndPointAndValidateAccess_identifier_clientInfo_outEndPointEntity_outEndPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getEndPointAndValidateAccess:identifier:clientInfo:outEndPointEntity:outEndPoint:");
}

id objc_msgSend__renewEndPointCAIfExpired_secureElement_forEndPointType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_renewEndPointCAIfExpired:secureElement:forEndPointType:");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend__withExportedBlob_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_withExportedBlob:error:");
}

id objc_msgSend__withNativePTData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_withNativePTData:error:");
}

id objc_msgSend_aa_altDSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_altDSID");
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_primaryAppleAccount");
}

id objc_msgSend_accessControlConstraintsItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessControlConstraintsItem");
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accounts");
}

id objc_msgSend_accountsWithAccountTypeIdentifiers_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountsWithAccountTypeIdentifiers:error:");
}

id objc_msgSend_acquireWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquireWithError:");
}

id objc_msgSend_activateWithToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateWithToken:");
}

id objc_msgSend_acwgSessionEntitlement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acwgSessionEntitlement");
}

id objc_msgSend_addDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDelegate:queue:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addHighPriorityRequestFor_client_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addHighPriorityRequestFor:client:");
}

id objc_msgSend_addIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIndex:");
}

id objc_msgSend_addItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addItem:");
}

id objc_msgSend_addNewSession_firstInQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNewSession:firstInQueue:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addPersistentStoreWithType_configuration_URL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPersistentStoreWithType:configuration:URL:options:error:");
}

id objc_msgSend_addSession_forConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSession:forConnection:");
}

id objc_msgSend_additionalAttestationsDict(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "additionalAttestationsDict");
}

id objc_msgSend_additionalData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "additionalData");
}

id objc_msgSend_agreedKmlSharingVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "agreedKmlSharingVersion");
}

id objc_msgSend_agreedKmlVehicleVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "agreedKmlVehicleVersion");
}

id objc_msgSend_alishaKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alishaKey");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allValues");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_anonymizedDsid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anonymizedDsid");
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendData:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_appendU16BE_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendU16BE:");
}

id objc_msgSend_appendU8_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendU8:");
}

id objc_msgSend_appletIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appletIdentifier");
}

id objc_msgSend_appletLockStateDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appletLockStateDidChange:");
}

id objc_msgSend_appletSupportedVersionsTlvForPairing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appletSupportedVersionsTlvForPairing");
}

id objc_msgSend_appletWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appletWithIdentifier:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_areFeaturesSupported_outError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "areFeaturesSupported:outError:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_asAsciiData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asAsciiData");
}

id objc_msgSend_asCKKSExternalKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asCKKSExternalKey");
}

id objc_msgSend_asCKKSExternalShare(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asCKKSExternalShare");
}

id objc_msgSend_asData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asData");
}

id objc_msgSend_asDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asDictionary");
}

id objc_msgSend_asHexString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asHexString");
}

id objc_msgSend_asOTPeerIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asOTPeerIdentity");
}

id objc_msgSend_assetACL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetACL");
}

id objc_msgSend_assetACLAttestation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetACLAttestation");
}

id objc_msgSend_assetACLAttestationItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetACLAttestationItem");
}

id objc_msgSend_assetACLItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetACLItem");
}

id objc_msgSend_assetId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetId");
}

id objc_msgSend_attributeWithDomain_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributeWithDomain:name:");
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributes");
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "auditToken");
}

id objc_msgSend_authenticationTag(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authenticationTag");
}

id objc_msgSend_authorizationID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authorizationID");
}

id objc_msgSend_authorizationInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authorizationInterval");
}

id objc_msgSend_authorizedKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authorizedKeys");
}

id objc_msgSend_available(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "available");
}

id objc_msgSend_base64(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_bindingAttestation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindingAttestation");
}

id objc_msgSend_bleAddress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bleAddress");
}

id objc_msgSend_bleIntroKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bleIntroKey");
}

id objc_msgSend_bleOOBMasterKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bleOOBMasterKey");
}

id objc_msgSend_bleUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bleUUID");
}

id objc_msgSend_blockRangingForReaderIdentifierWithReaderIdentifier_timeout_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blockRangingForReaderIdentifierWithReaderIdentifier:timeout:error:");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_BOOLValueForSetting_manufacturer_brand_uuid_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValueForSetting:manufacturer:brand:uuid:error:");
}

id objc_msgSend_brand(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "brand");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleRecordForAuditToken_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleRecordForAuditToken:error:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bytes");
}

id objc_msgSend_cacheProximityChipData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cacheProximityChipData");
}

id objc_msgSend_cacheProximityChipData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cacheProximityChipData:");
}

id objc_msgSend_callback(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callback");
}

id objc_msgSend_callerError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callerError");
}

id objc_msgSend_canSend(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canSend");
}

id objc_msgSend_cancelBackGroundTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelBackGroundTimer");
}

id objc_msgSend_cancelRKERequestWithFunctionIdentifier_keyIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelRKERequestWithFunctionIdentifier:keyIdentifier:");
}

id objc_msgSend_carOEMProprietaryData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "carOEMProprietaryData");
}

id objc_msgSend_casdCertificate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "casdCertificate");
}

id objc_msgSend_casdCertificateRSA(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "casdCertificateRSA");
}

id objc_msgSend_casdECDSACertificate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "casdECDSACertificate");
}

id objc_msgSend_casdRSACertificate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "casdRSACertificate");
}

id objc_msgSend_certificateAuthorities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "certificateAuthorities");
}

id objc_msgSend_certificates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "certificates");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_childWithTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "childWithTag:");
}

id objc_msgSend_children(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "children");
}

id objc_msgSend_cipherText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cipherText");
}

id objc_msgSend_cleanup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanup");
}

id objc_msgSend_clearAlarm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearAlarm:");
}

id objc_msgSend_clientAppIsBackGrounded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientAppIsBackGrounded:");
}

id objc_msgSend_clientAppIsForeGrounded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientAppIsForeGrounded:");
}

id objc_msgSend_clientAppIsSuspended_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientAppIsSuspended:");
}

id objc_msgSend_clientBundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientBundleIdentifier");
}

id objc_msgSend_clientName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientName");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "code");
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commit");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_confidentialMailBoxSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "confidentialMailBoxSize");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configuration");
}

id objc_msgSend_configurationWithOpt1_opt2_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithOpt1:opt2:");
}

id objc_msgSend_configurePrivateData_confidentialData_contactlessPersistentVisibility_wiredPersistentVisibility_nfcExpressOnlyInLPM_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurePrivateData:confidentialData:contactlessPersistentVisibility:wiredPersistentVisibility:nfcExpressOnlyInLPM:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connection");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsWithFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsWithFilter:");
}

id objc_msgSend_continueExecutingRKERequestWithFunctionIdentifier_actionIdentifier_arbitraryData_keyIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "continueExecutingRKERequestWithFunctionIdentifier:actionIdentifier:arbitraryData:keyIdentifier:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_copyItemData_outData_updateToApplePayView_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyItemData:outData:updateToApplePayView:error:");
}

id objc_msgSend_copyMultipleItemData_outDatas_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyMultipleItemData:outDatas:error:");
}

id objc_msgSend_copyPathForPersonalizedData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyPathForPersonalizedData:error:");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countForObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countForObject:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createFidoAttestationWithSecureElement_instanceAID_fidoKey_relyingParty_relyingPartyAccountHash_challenge_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createFidoAttestationWithSecureElement:instanceAID:fidoKey:relyingParty:relyingPartyAccountHash:challenge:error:");
}

id objc_msgSend_createPrivacyKeyWithGroupIdentifier_options_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createPrivacyKeyWithGroupIdentifier:options:completion:");
}

id objc_msgSend_csn(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "csn");
}

id objc_msgSend_currentCompatibilityVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentCompatibilityVersion");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentConnection");
}

id objc_msgSend_currentContentVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentContentVersion");
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentState");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "data");
}

id objc_msgSend_dataTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataTaskWithRequest:completionHandler:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_dataWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithCapacity:");
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:options:error:");
}

id objc_msgSend_dataWithDERItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithDERItem:");
}

id objc_msgSend_dataWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithData:");
}

id objc_msgSend_dataWithHexString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithHexString:");
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithLength:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_dataWithTLVs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithTLVs:");
}

id objc_msgSend_database(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "database");
}

id objc_msgSend_databaseService_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "databaseService:reply:");
}

id objc_msgSend_databaseServiceWithProxy_isReconcileRequired_reason_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "databaseServiceWithProxy:isReconcileRequired:reason:reply:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_dckSessionEntitlement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dckSessionEntitlement");
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "debugDescription");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntegerForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeWithData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeWithData:error:");
}

id objc_msgSend_decryptPayload_groupIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decryptPayload:groupIdentifier:completion:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultStore");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegate");
}

id objc_msgSend_deleteEndPointLongTermPrivacyKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteEndPointLongTermPrivacyKey");
}

id objc_msgSend_deleteItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteItem:");
}

id objc_msgSend_deleteKeyWithRelyingParty_relyingPartyAccountHash_fidoKeyHash_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteKeyWithRelyingParty:relyingPartyAccountHash:fidoKeyHash:error:");
}

id objc_msgSend_deleteObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteObject:");
}

id objc_msgSend_deletePrivacyKey_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deletePrivacyKey:completion:");
}

id objc_msgSend_deleteSEView_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteSEView:reply:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "description");
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptor");
}

id objc_msgSend_designateKeyWithAid_slotNumber_keyIdentifier_assetACL_assetACLAttestation_operationApprovalVersion_designation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "designateKeyWithAid:slotNumber:keyIdentifier:assetACL:assetACLAttestation:operationApprovalVersion:designation:");
}

id objc_msgSend_designation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "designation");
}

id objc_msgSend_deviceCapabilities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceCapabilities");
}

id objc_msgSend_deviceConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceConfiguration");
}

id objc_msgSend_deviceEnteredPasscode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceEnteredPasscode");
}

id objc_msgSend_deviceForFromID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceForFromID:");
}

id objc_msgSend_deviceList(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceList");
}

id objc_msgSend_deviceListWithContext_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceListWithContext:completion:");
}

id objc_msgSend_devicePrimaryPaymentApplication(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "devicePrimaryPaymentApplication");
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceType");
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "devices");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryForKey:");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didAppEnterBackground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didAppEnterBackground:");
}

id objc_msgSend_didAppEnterForeground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didAppEnterForeground:");
}

id objc_msgSend_didAppGetSuspended_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didAppGetSuspended:");
}

id objc_msgSend_didCloseConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didCloseConnection:");
}

id objc_msgSend_didCreateKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didCreateKey:");
}

id objc_msgSend_didCreateKey_forVehicle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didCreateKey:forVehicle:");
}

id objc_msgSend_didEnd_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didEnd:");
}

id objc_msgSend_didError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didError");
}

id objc_msgSend_didInvalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didInvalidate");
}

id objc_msgSend_didInvalidateWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didInvalidateWithError:");
}

id objc_msgSend_didLoadKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didLoadKey:");
}

id objc_msgSend_didReceiveContinuationRequestFor_actionIdentifier_arbitraryData_fromVehicle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveContinuationRequestFor:actionIdentifier:arbitraryData:fromVehicle:");
}

id objc_msgSend_didReceiveInvitationRequestWithUuid_ownerKeyIdentifier_friendKeyIdentifier_targetType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveInvitationRequestWithUuid:ownerKeyIdentifier:friendKeyIdentifier:targetType:");
}

id objc_msgSend_didReceivePassthroughMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceivePassthroughMessage:");
}

id objc_msgSend_didReceivePassthroughMessage_fromVehicle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceivePassthroughMessage:fromVehicle:");
}

id objc_msgSend_didReceivePassthroughMessage_keyIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceivePassthroughMessage:keyIdentifier:");
}

id objc_msgSend_didReceiveSharingInvitationRequest_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveSharingInvitationRequest:withCompletion:");
}

id objc_msgSend_didReceiveSharingInvitationWithIdentifier_uuid_metadata_ownerIdsId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveSharingInvitationWithIdentifier:uuid:metadata:ownerIdsId:");
}

id objc_msgSend_didStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didStart:");
}

id objc_msgSend_didStartSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didStartSession:");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayName");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "domain");
}

id objc_msgSend_done(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "done");
}

id objc_msgSend_doubleForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleForKey:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_downloadAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadAsset:");
}

id objc_msgSend_downloadTimeoutInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadTimeoutInterval");
}

id objc_msgSend_dumpState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dumpState");
}

id objc_msgSend_ecdsaCertificate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ecdsaCertificate");
}

id objc_msgSend_embeddedSecureElementWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "embeddedSecureElementWithError:");
}

id objc_msgSend_emptySlot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emptySlot:");
}

id objc_msgSend_enableVehicleEnteredPasscode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableVehicleEnteredPasscode");
}

id objc_msgSend_enabledOnContactless(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enabledOnContactless");
}

id objc_msgSend_enabledOnWire(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enabledOnWire");
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInteger:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodeWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeWithError:");
}

id objc_msgSend_encryptPayload_scheme_recipientPublicKey_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encryptPayload:scheme:recipientPublicKey:completion:");
}

id objc_msgSend_encryptedData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encryptedData");
}

id objc_msgSend_encryptedRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encryptedRequest");
}

id objc_msgSend_encryptedWrappedKeyBlobItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encryptedWrappedKeyBlobItem");
}

id objc_msgSend_encryptionPublicKeyData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encryptionPublicKeyData");
}

id objc_msgSend_endPointAction_clientInfo_reason_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endPointAction:clientInfo:reason:reply:");
}

id objc_msgSend_endPointAction_proxy_clientInfo_reason_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endPointAction:proxy:clientInfo:reason:reply:");
}

id objc_msgSend_endPointAttestationData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endPointAttestationData");
}

id objc_msgSend_endPointCAData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endPointCAData");
}

id objc_msgSend_endPointCAWithIdentifier_subjectIdentifier_instanceAID_secureElementAttestation_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endPointCAWithIdentifier:subjectIdentifier:instanceAID:secureElementAttestation:error:");
}

id objc_msgSend_endPointDBAction_clientInfo_reason_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endPointDBAction:clientInfo:reason:reply:");
}

id objc_msgSend_endPointData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endPointData");
}

id objc_msgSend_endPointServiceAvailable_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endPointServiceAvailable:reply:");
}

id objc_msgSend_endPointServiceAvailableWithProxy_reason_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endPointServiceAvailableWithProxy:reason:reply:");
}

id objc_msgSend_endPointType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endPointType");
}

id objc_msgSend_endPointWithType_appletIdentifier_identifier_certificateData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endPointWithType:appletIdentifier:identifier:certificateData:error:");
}

id objc_msgSend_endPoints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endPoints");
}

id objc_msgSend_endSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endSession");
}

id objc_msgSend_endSessionInternal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endSessionInternal:");
}

id objc_msgSend_endSessionWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endSessionWithCompletion:");
}

id objc_msgSend_endowmentNamespaces(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endowmentNamespaces");
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endpoint");
}

id objc_msgSend_endpointId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endpointId");
}

id objc_msgSend_endpointIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endpointIdentifier");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:");
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "environment");
}

id objc_msgSend_epAuthResponse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "epAuthResponse");
}

id objc_msgSend_ephemeralPublicKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ephemeralPublicKey");
}

id objc_msgSend_ephemeralPublicKeydata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ephemeralPublicKeydata");
}

id objc_msgSend_errorCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorCount");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_eventPublisher(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventPublisher");
}

id objc_msgSend_eventPublisherQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventPublisherQueue");
}

id objc_msgSend_executeFetchRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeFetchRequest:error:");
}

id objc_msgSend_expressModeControlState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expressModeControlState:");
}

id objc_msgSend_fetchCliqueStatus_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchCliqueStatus:error:");
}

id objc_msgSend_fetchRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRequest");
}

id objc_msgSend_fetchSEViewKeyHierarchy_forceFetch_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchSEViewKeyHierarchy:forceFetch:reply:");
}

id objc_msgSend_fetchTrustedSecureElementIdentities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchTrustedSecureElementIdentities:");
}

id objc_msgSend_fidoKeyFound(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fidoKeyFound");
}

id objc_msgSend_fidoKeyHash(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fidoKeyHash");
}

id objc_msgSend_fidoKeyNotFound(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fidoKeyNotFound");
}

id objc_msgSend_fidoVerificationFailed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fidoVerificationFailed");
}

id objc_msgSend_fidoVerificationSucceeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fidoVerificationSucceeded");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_filter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filter:");
}

id objc_msgSend_filterMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterMap:");
}

id objc_msgSend_find_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "find:");
}

id objc_msgSend_findKeyForRelyingParty_relyingPartyAccountHash_fidoKeyHash_secureElement_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findKeyForRelyingParty:relyingPartyAccountHash:fidoKeyHash:secureElement:error:");
}

id objc_msgSend_findKeyWithKeyIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findKeyWithKeyIdentifier:");
}

id objc_msgSend_finishedSharingForKey_result_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishedSharingForKey:result:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_friendKeyIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "friendKeyIdentifier");
}

id objc_msgSend_friendlyName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "friendlyName");
}

id objc_msgSend_functionIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "functionIdentifier");
}

id objc_msgSend_genericData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "genericData");
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getActivePairedDevice");
}

id objc_msgSend_getAllEndpoints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAllEndpoints");
}

id objc_msgSend_getAllowedVehicleIdentifiersForConnection_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAllowedVehicleIdentifiersForConnection:error:");
}

id objc_msgSend_getAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAndReturnError:");
}

id objc_msgSend_getAvailableTLKForViewName_secureElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAvailableTLKForViewName:secureElement:");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getEncryptedCarOEMProprietaryData_withEndpointEntity_withSecureElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getEncryptedCarOEMProprietaryData:withEndpointEntity:withSecureElement:");
}

id objc_msgSend_getEncryptionCertificateFor_environment_region_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getEncryptionCertificateFor:environment:region:error:");
}

id objc_msgSend_getEndpointUser(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getEndpointUser");
}

id objc_msgSend_getEndpointWithKeyIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getEndpointWithKeyIdentifier:");
}

id objc_msgSend_getEndpointWithReaderIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getEndpointWithReaderIdentifier:");
}

id objc_msgSend_getEnduringRKERequestsInProgress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getEnduringRKERequestsInProgress");
}

id objc_msgSend_getExpressConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getExpressConfiguration:");
}

id objc_msgSend_getExpressPassConfigWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getExpressPassConfigWithError:");
}

id objc_msgSend_getExternalCACertificateFor_environment_prodSE_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getExternalCACertificateFor:environment:prodSE:error:");
}

id objc_msgSend_getInformation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getInformation");
}

id objc_msgSend_getInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getInstance");
}

id objc_msgSend_getKeyHandle_key_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getKeyHandle:key:error:");
}

id objc_msgSend_getLPEMFeaturesWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getLPEMFeaturesWithError:");
}

id objc_msgSend_getLocalFileUrl(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getLocalFileUrl");
}

id objc_msgSend_getNFManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getNFManager");
}

id objc_msgSend_getOccupiedLegacyKeySlots_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getOccupiedLegacyKeySlots:");
}

id objc_msgSend_getPrivacyKeyWithGroupIdentifier_keyIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPrivacyKeyWithGroupIdentifier:keyIdentifier:completion:");
}

id objc_msgSend_getReaderInformation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getReaderInformation");
}

id objc_msgSend_getReporter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getReporter");
}

id objc_msgSend_getReportsWithIsInternalClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getReportsWithIsInternalClient:");
}

id objc_msgSend_getRootCertificateFor_keyID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getRootCertificateFor:keyID:error:");
}

id objc_msgSend_getRoutingInformation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getRoutingInformation");
}

id objc_msgSend_getSecureElementSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSecureElementSession");
}

id objc_msgSend_getSecureElementWithReason_callback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSecureElementWithReason:callback:");
}

id objc_msgSend_getSettingForKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSettingForKey:error:");
}

id objc_msgSend_getSignatureCertificateFor_environment_region_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSignatureCertificateFor:environment:region:error:");
}

id objc_msgSend_getSupportedLyonVersions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSupportedLyonVersions");
}

id objc_msgSend_getTestReporter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTestReporter");
}

id objc_msgSend_getTotalNumberOfSharedKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTotalNumberOfSharedKeys");
}

id objc_msgSend_getType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getType");
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getUUIDBytes:");
}

id objc_msgSend_getUsableKeySlot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getUsableKeySlot:");
}

id objc_msgSend_getUsableLegacyKeySlot_outError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getUsableLegacyKeySlot:outError:");
}

id objc_msgSend_getValueWithSignificantDigits_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getValueWithSignificantDigits:value:");
}

id objc_msgSend_getWeeksTryingToDownload(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getWeeksTryingToDownload");
}

id objc_msgSend_getX(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getX");
}

id objc_msgSend_handleAvailableAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAvailableAsset:");
}

id objc_msgSend_handleConnectionSetupResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleConnectionSetupResult:");
}

id objc_msgSend_handleCrossPlatformParseInvitationStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleCrossPlatformParseInvitationStatus:");
}

id objc_msgSend_handleCrossPlatformSharingMessage_fromMailboxIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleCrossPlatformSharingMessage:fromMailboxIdentifier:");
}

id objc_msgSend_handleCrossPlatformSigningRequest_status_keyInformation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleCrossPlatformSigningRequest:status:keyInformation:");
}

id objc_msgSend_handleDownloadedAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDownloadedAsset:");
}

id objc_msgSend_handleEncryptionResult_trackingRequest_keyInformation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleEncryptionResult:trackingRequest:keyInformation:");
}

id objc_msgSend_handleExchangeStartedWithFriendKey_status_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleExchangeStartedWithFriendKey:status:");
}

id objc_msgSend_handleFirstPostPairingTransactionEndResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFirstPostPairingTransactionEndResult:");
}

id objc_msgSend_handleFirstTransactionCompletionResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFirstTransactionCompletionResult:");
}

id objc_msgSend_handleFirstUnlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFirstUnlock");
}

id objc_msgSend_handleForIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleForIdentifier:error:");
}

id objc_msgSend_handleFriendSideKeySharingCancelStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFriendSideKeySharingCancelStatus:");
}

id objc_msgSend_handleIncomingApdu_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleIncomingApdu:error:");
}

id objc_msgSend_handleIncomingMessage_fromRemoteIdsIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleIncomingMessage:fromRemoteIdsIdentifier:");
}

id objc_msgSend_handleIncomingMessage_metaData_bindingAttestation_keyIdentifier_uuid_messageType_targetDeviceType_remoteIdsIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleIncomingMessage:metaData:bindingAttestation:keyIdentifier:uuid:messageType:targetDeviceType:remoteIdsIdentifier:");
}

id objc_msgSend_handleIncomingTestData_fromRemoteIdsIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleIncomingTestData:fromRemoteIdsIdentifier:");
}

id objc_msgSend_handleInitiatorMessageResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInitiatorMessageResult:");
}

id objc_msgSend_handleKeyCreationCancellationResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleKeyCreationCancellationResult:");
}

id objc_msgSend_handleKeyCreationCompletionResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleKeyCreationCompletionResult:");
}

id objc_msgSend_handleKeyPairingCompletionResult_keyInformation_trackingRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleKeyPairingCompletionResult:keyInformation:trackingRequest:");
}

id objc_msgSend_handleKeysExchangeDoneWaitForMailboxes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleKeysExchangeDoneWaitForMailboxes");
}

id objc_msgSend_handleKmlOwnerPairingCancellationResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleKmlOwnerPairingCancellationResult:");
}

id objc_msgSend_handleKmlOwnerPairingCompletionWithResult_keyInformation_keyTrackingRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleKmlOwnerPairingCompletionWithResult:keyInformation:keyTrackingRequest:");
}

id objc_msgSend_handleKmlOwnerPairingDidStart(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleKmlOwnerPairingDidStart");
}

id objc_msgSend_handleKmlOwnerPairingFirstTransactionCompletionResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleKmlOwnerPairingFirstTransactionCompletionResult:");
}

id objc_msgSend_handleKmlOwnerPairingPreWarmCompletionResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleKmlOwnerPairingPreWarmCompletionResult:");
}

id objc_msgSend_handleKmlOwnerPairingProbingCompletionWithBrandCode_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleKmlOwnerPairingProbingCompletionWithBrandCode:error:");
}

id objc_msgSend_handleKmlOwnerPairingStartResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleKmlOwnerPairingStartResult:");
}

id objc_msgSend_handleKmlOwnerPairingTrackingReceiptSaveResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleKmlOwnerPairingTrackingReceiptSaveResult:");
}

id objc_msgSend_handleMailboxConfigurationDone(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleMailboxConfigurationDone");
}

id objc_msgSend_handleOwnerCrossPlatformInvitations_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleOwnerCrossPlatformInvitations:withError:");
}

id objc_msgSend_handleOwnerKeySharingCancelStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleOwnerKeySharingCancelStatus:");
}

id objc_msgSend_handleOwnerKeySharingCancelledWithStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleOwnerKeySharingCancelledWithStatus:");
}

id objc_msgSend_handleOwnerKeySharingInvitations_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleOwnerKeySharingInvitations:withError:");
}

id objc_msgSend_handleOwnerPairingCancellationWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleOwnerPairingCancellationWithResult:");
}

id objc_msgSend_handlePairingDidStart(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePairingDidStart");
}

id objc_msgSend_handlePairingTransportSessionFailedWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePairingTransportSessionFailedWithError:");
}

id objc_msgSend_handlePasscodeRetryRequestedForInvitation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePasscodeRetryRequestedForInvitation:");
}

id objc_msgSend_handlePreWarmCompletionResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePreWarmCompletionResult:");
}

id objc_msgSend_handlePreWarmResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePreWarmResult:");
}

id objc_msgSend_handleProbingCompletionWithBrandCode_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleProbingCompletionWithBrandCode:error:");
}

id objc_msgSend_handleQuerySuccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleQuerySuccess:");
}

id objc_msgSend_handleRecipientMessageResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleRecipientMessageResult:");
}

id objc_msgSend_handleRemoteConfigurationReceived(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleRemoteConfigurationReceived");
}

id objc_msgSend_handleSendMessageResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleSendMessageResult:");
}

id objc_msgSend_handleSendMessageResult_forMessageIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleSendMessageResult:forMessageIdentifier:");
}

id objc_msgSend_handleSentInvitationWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleSentInvitationWithIdentifier:");
}

id objc_msgSend_handleSessionEndResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleSessionEndResult:");
}

id objc_msgSend_handleSessionPauseResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleSessionPauseResult:");
}

id objc_msgSend_handleSessionResumeResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleSessionResumeResult:");
}

id objc_msgSend_handleSessionStartResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleSessionStartResult:");
}

id objc_msgSend_handleSharingCancelledMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleSharingCancelledMessage:");
}

id objc_msgSend_handleSharingCompleteForInvitationIdentifier_localShare_bindingAttestationUsed_status_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleSharingCompleteForInvitationIdentifier:localShare:bindingAttestationUsed:status:");
}

id objc_msgSend_handleTransactionEndResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleTransactionEndResult:");
}

id objc_msgSend_handleTransactionStartResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleTransactionStartResult:");
}

id objc_msgSend_handleTransportSetupResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleTransportSetupResult:");
}

id objc_msgSend_hasChanges(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasChanges");
}

id objc_msgSend_haveAvailableTLKForEncryptedData_secureElement_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "haveAvailableTLKForEncryptedData:secureElement:error:");
}

id objc_msgSend_hexStringAsData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hexStringAsData");
}

id objc_msgSend_homeDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "homeDefaults");
}

id objc_msgSend_hupData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hupData");
}

id objc_msgSend_hydraDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hydraDefaults");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_identifierWithPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifierWithPid:");
}

id objc_msgSend_increaseLengthBy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "increaseLengthBy:");
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexSet");
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "info");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "init");
}

id objc_msgSend_init_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "init:");
}

id objc_msgSend_initCredentialProvisionedResultWithCredentialIdentifier_keyInformation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initCredentialProvisionedResultWithCredentialIdentifier:keyInformation:");
}

id objc_msgSend_initDataRequiredResultWithResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initDataRequiredResultWithResponse:");
}

id objc_msgSend_initFailureResultWithCrdentialIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initFailureResultWithCrdentialIdentifier:error:");
}

id objc_msgSend_initFailureResultWithResponse_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initFailureResultWithResponse:error:");
}

id objc_msgSend_initInviteAcceptedResultWithResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initInviteAcceptedResultWithResponse:");
}

id objc_msgSend_initPasscodeFailureResultWithCredentialIdentifier_retryCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initPasscodeFailureResultWithCredentialIdentifier:retryCount:");
}

id objc_msgSend_initWithAID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAID:");
}

id objc_msgSend_initWithAppBundleID_nonce_signedData_signature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAppBundleID:nonce:signedData:signature:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithBase64EncodedData_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBase64EncodedData:options:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithConcurrencyType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConcurrencyType:");
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfURL:");
}

id objc_msgSend_initWithContextData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContextData:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEndpoint:");
}

id objc_msgSend_initWithExplanation_target_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExplanation:target:attributes:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithFormat_type_genericSharingDict_appleSharingDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:type:genericSharingDict:appleSharingDict:");
}

id objc_msgSend_initWithGenericCrossPlatformSharingData_additionalData_privateData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGenericCrossPlatformSharingData:additionalData:privateData:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithInformation_readerIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInformation:readerIdentifier:");
}

id objc_msgSend_initWithKeyInformation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKeyInformation:");
}

id objc_msgSend_initWithLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLength:");
}

id objc_msgSend_initWithMachPort_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachPort:queue:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithManagedObjectModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithManagedObjectModel:");
}

id objc_msgSend_initWithPassword_salt_authenticatedData_keyDerivationCost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPassword:salt:authenticatedData:keyDerivationCost:");
}

id objc_msgSend_initWithProfile_displayName_metaData_targetDeviceType_enableVehiclePasscode_maxRetriesForDevicePasscode_deviceEnteredPasscode_proprietaryEntitlements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProfile:displayName:metaData:targetDeviceType:enableVehiclePasscode:maxRetriesForDevicePasscode:deviceEnteredPasscode:proprietaryEntitlements:");
}

id objc_msgSend_initWithPublicKey_secretKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPublicKey:secretKey:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithReaderInformation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithReaderInformation:");
}

id objc_msgSend_initWithRemoteObject_connection_andQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRemoteObject:connection:andQueue:");
}

id objc_msgSend_initWithRemoteObject_keyIdentifier_appletIdentifier_options_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRemoteObject:keyIdentifier:appletIdentifier:options:queue:");
}

id objc_msgSend_initWithRemoteObject_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRemoteObject:queue:");
}

id objc_msgSend_initWithRemoteObject_subscriptionRange_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRemoteObject:subscriptionRange:queue:");
}

id objc_msgSend_initWithService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithService:");
}

id objc_msgSend_initWithSessionUUID_invitationIdentifier_friendKeyIdentifier_sharingTarget_state_vehicleEnteredPasscode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSessionUUID:invitationIdentifier:friendKeyIdentifier:sharingTarget:state:vehicleEnteredPasscode:");
}

id objc_msgSend_initWithSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSet:");
}

id objc_msgSend_initWithSharingIdentifier_friendKeyIdentifier_sharingMessageType_message_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSharingIdentifier:friendKeyIdentifier:sharingMessageType:message:");
}

id objc_msgSend_initWithSharingSessionIdentifier_subCaAttestation_casd_rsaCertData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSharingSessionIdentifier:subCaAttestation:casd:rsaCertData:");
}

id objc_msgSend_initWithSharingSessionUUID_bindingAttestation_targetDeviceType_initiatorIdsPseudonym_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSharingSessionUUID:bindingAttestation:targetDeviceType:initiatorIdsPseudonym:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithVehicleEnteredPasscode_pairedEntityIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithVehicleEnteredPasscode:pairedEntityIdentifier:");
}

id objc_msgSend_initWithVersion_ephemeralPublicKey_publicKeyHash_encryptedRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithVersion:ephemeralPublicKey:publicKeyHash:encryptedRequest:");
}

id objc_msgSend_initializeRAMRepresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initializeRAMRepresentation:");
}

id objc_msgSend_initiatorIdsPseudonym(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initiatorIdsPseudonym");
}

id objc_msgSend_insertNewObjectForEntityForName_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertNewObjectForEntityForName:inManagedObjectContext:");
}

id objc_msgSend_insertWithEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertWithEndpoint:");
}

id objc_msgSend_instance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instance");
}

id objc_msgSend_instanceRepresentations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instanceRepresentations");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intValue");
}

id objc_msgSend_intValueForSetting_manufacturer_brand_uuid_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intValueForSetting:manufacturer:brand:uuid:error:");
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerForKey:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interface");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateInternal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateInternal");
}

id objc_msgSend_invitationSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invitationSet");
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isActive");
}

id objc_msgSend_isAlarmSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAlarmSet:");
}

id objc_msgSend_isAllZero(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAllZero");
}

id objc_msgSend_isBackgrounded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBackgrounded");
}

id objc_msgSend_isCarKeyPass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCarKeyPass");
}

id objc_msgSend_isDCKConfigurationAvailableFor_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDCKConfigurationAvailableFor:error:");
}

id objc_msgSend_isDebugAllowAllEndpointsEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDebugAllowAllEndpointsEnabled");
}

id objc_msgSend_isEligibleAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEligibleAsset:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToBytes:length:");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToHexCString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToHexCString:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExportedData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isExportedData");
}

id objc_msgSend_isFirstLaunchAfterBootForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFirstLaunchAfterBootForKey:");
}

id objc_msgSend_isPassLibraryAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPassLibraryAvailable");
}

id objc_msgSend_isPassiveEntryAvailableFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPassiveEntryAvailableFor:");
}

id objc_msgSend_isPeerConnectedWithClientUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPeerConnectedWithClientUUID:");
}

id objc_msgSend_isPreArmed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPreArmed");
}

id objc_msgSend_isProd(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isProd");
}

id objc_msgSend_isReadableFileAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isReadableFileAtPath:");
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRunning");
}

id objc_msgSend_isSubsetOfSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSubsetOfSet:");
}

id objc_msgSend_isSupported(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSupported");
}

id objc_msgSend_isWaitingForSecureElement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isWaitingForSecureElement");
}

id objc_msgSend_isWritableFileAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isWritableFileAtPath:");
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "key");
}

id objc_msgSend_keyAttestationError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyAttestationError");
}

id objc_msgSend_keyBlobItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyBlobItem");
}

id objc_msgSend_keyCreationError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyCreationError");
}

id objc_msgSend_keyData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyData");
}

id objc_msgSend_keyDecodeError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyDecodeError");
}

id objc_msgSend_keyExportError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyExportError");
}

id objc_msgSend_keyIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyIdentifier");
}

id objc_msgSend_keyNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyNumber");
}

id objc_msgSend_keyOperation_keyData_reason_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyOperation:keyData:reason:reply:");
}

id objc_msgSend_keyRole(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyRole");
}

id objc_msgSend_keyRoleToShare(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyRoleToShare");
}

id objc_msgSend_keyServiceAvailable_reason_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyServiceAvailable:reason:reply:");
}

id objc_msgSend_keychainAddError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keychainAddError");
}

id objc_msgSend_keys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keys");
}

id objc_msgSend_kickOff(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "kickOff");
}

id objc_msgSend_kickOffAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "kickOffAndReturnError:");
}

id objc_msgSend_kickoff(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "kickoff");
}

id objc_msgSend_kmlOverrideVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "kmlOverrideVersion");
}

id objc_msgSend_kmlSupportedVersionsTlvForPairing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "kmlSupportedVersionsTlvForPairing");
}

id objc_msgSend_kmlSupportedVersionsTlvForShareInitiator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "kmlSupportedVersionsTlvForShareInitiator");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastObject");
}

id objc_msgSend_legacyKeyServiceAvailable_reason_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "legacyKeyServiceAvailable:reason:reply:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_lengthOfBytesUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lengthOfBytesUsingEncoding:");
}

id objc_msgSend_localPeerIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localPeerIdentity");
}

id objc_msgSend_localeWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localeWithLocaleIdentifier:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedFailureReason");
}

id objc_msgSend_logEncryptedAPDU_decrypted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logEncryptedAPDU:decrypted:");
}

id objc_msgSend_logOptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logOptions");
}

id objc_msgSend_loginID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loginID");
}

id objc_msgSend_longTermSharedSecret(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longTermSharedSecret");
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longValue");
}

id objc_msgSend_lyonHomeDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lyonHomeDefaults");
}

id objc_msgSend_lyonHydraDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lyonHydraDefaults");
}

id objc_msgSend_mailboxMapping(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mailboxMapping");
}

id objc_msgSend_mailboxSizesPlusAdditionalData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mailboxSizesPlusAdditionalData");
}

id objc_msgSend_manufacturer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "manufacturer");
}

id objc_msgSend_maxRetriesForDeviceEnteredPasscode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxRetriesForDeviceEnteredPasscode");
}

id objc_msgSend_maybeQueryMetadata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maybeQueryMetadata");
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "message");
}

id objc_msgSend_messageQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageQueue");
}

id objc_msgSend_messageType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageType");
}

id objc_msgSend_metaData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metaData");
}

id objc_msgSend_metadataQueryInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataQueryInterval");
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_mobileAssetManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mobileAssetManager");
}

id objc_msgSend_mockRefreshInstanceCA(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mockRefreshInstanceCA");
}

id objc_msgSend_modifyTLKSharesForSEView_adding_deleting_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modifyTLKSharesForSEView:adding:deleting:reply:");
}

id objc_msgSend_monitor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitor");
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableBytes");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_newSERequestWithReason_callback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newSERequestWithReason:callback:");
}

id objc_msgSend_nfcExpressOnlyInLPM(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nfcExpressOnlyInLPM");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "now");
}

id objc_msgSend_number(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "number");
}

id objc_msgSend_numberFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberFromString:");
}

id objc_msgSend_numberOfPairingSessionsQueued(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfPairingSessionsQueued");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedShort:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_observerWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observerWithDelegate:");
}

id objc_msgSend_onAssertionAcquiredWithIdentifier_for_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onAssertionAcquiredWithIdentifier:for:");
}

id objc_msgSend_onAssertionReleasedWithIdentifier_for_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onAssertionReleasedWithIdentifier:for:");
}

id objc_msgSend_onDarwinNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onDarwinNotification:");
}

id objc_msgSend_onFirstUnlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onFirstUnlock");
}

id objc_msgSend_onTrackingCompleteFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onTrackingCompleteFor:");
}

id objc_msgSend_openApplication_withOptions_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openApplication:withOptions:completion:");
}

id objc_msgSend_opt1(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "opt1");
}

id objc_msgSend_opt2(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "opt2");
}

id objc_msgSend_optA(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optA");
}

id objc_msgSend_optionsForInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionsForInterval:");
}

id objc_msgSend_optionsWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionsWithDictionary:");
}

id objc_msgSend_otCliqueForAltDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "otCliqueForAltDSID:");
}

id objc_msgSend_ourPreferredKmlVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ourPreferredKmlVersion");
}

id objc_msgSend_ownerCompletionHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ownerCompletionHandler");
}

id objc_msgSend_ownerEphemeralKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ownerEphemeralKey");
}

id objc_msgSend_ownerIdsIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ownerIdsIdentifier");
}

id objc_msgSend_pairedReaderIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pairedReaderIdentifier");
}

id objc_msgSend_pairingEndedWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pairingEndedWithError:");
}

id objc_msgSend_pairingEndedWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pairingEndedWithResult:");
}

id objc_msgSend_parsePTAExtension_certificate_specification_output_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parsePTAExtension:certificate:specification:output:");
}

id objc_msgSend_passUniqueIDsForAssociatedApplicationIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passUniqueIDsForAssociatedApplicationIdentifier:");
}

id objc_msgSend_passcodeRetryRequestedFor_retriesLeft_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passcodeRetryRequestedFor:retriesLeft:");
}

id objc_msgSend_passes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passes");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "path");
}

id objc_msgSend_pauseRangingFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pauseRangingFor:");
}

id objc_msgSend_peerIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peerIdentifier");
}

id objc_msgSend_performBlockAndWait_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlockAndWait:");
}

id objc_msgSend_performFidoSignatureWithSecureElement_instanceAID_loadedKey_relyingParty_relyingPartyAccountHash_challenge_ptaEndPointIdentifierForExtension_externalizedAuth_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performFidoSignatureWithSecureElement:instanceAID:loadedKey:relyingParty:relyingPartyAccountHash:challenge:ptaEndPointIdentifierForExtension:externalizedAuth:error:");
}

id objc_msgSend_performFidoVerificationWithPublicKey_signedChallenge_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performFidoVerificationWithPublicKey:signedChallenge:error:");
}

id objc_msgSend_persistentConfigID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentConfigID");
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pid");
}

id objc_msgSend_popFirst(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popFirst");
}

id objc_msgSend_postCAEventFor_eventInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postCAEventFor:eventInput:");
}

id objc_msgSend_postNotificationName_object_userInfo_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:options:");
}

id objc_msgSend_predicateMatchingIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateMatchingIdentifier:");
}

id objc_msgSend_prependCertificateChain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prependCertificateChain:");
}

id objc_msgSend_privacyEncryptionPK(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "privacyEncryptionPK");
}

id objc_msgSend_privacyKeyIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "privacyKeyIdentifier");
}

id objc_msgSend_privacyPublicKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "privacyPublicKey");
}

id objc_msgSend_privateMailBoxSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "privateMailBoxSize");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processInfo");
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processName");
}

id objc_msgSend_processResponseWithY_M1_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processResponseWithY:M1:");
}

id objc_msgSend_prodMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prodMode");
}

id objc_msgSend_profile(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "profile");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_proposeTLKForSEView_proposedTLK_wrappedOldTLK_tlkShares_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proposeTLKForSEView:proposedTLK:wrappedOldTLK:tlkShares:reply:");
}

id objc_msgSend_ptcViewName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ptcViewName");
}

id objc_msgSend_publicKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publicKey");
}

id objc_msgSend_publicKeyData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publicKeyData");
}

id objc_msgSend_publicKeyIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publicKeyIdentifier");
}

id objc_msgSend_purge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purge:");
}

id objc_msgSend_pushLast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushLast:");
}

id objc_msgSend_pushSecureElementToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushSecureElementToken:");
}

id objc_msgSend_queryMA(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryMA");
}

id objc_msgSend_queryMetaData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryMetaData:");
}

id objc_msgSend_queryMetadata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryMetadata");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queue");
}

id objc_msgSend_queueServerConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queueServerConnection:");
}

id objc_msgSend_randomData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "randomData:");
}

id objc_msgSend_randomElement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "randomElement");
}

id objc_msgSend_readAPDU(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readAPDU");
}

id objc_msgSend_readAPDU_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readAPDU:");
}

id objc_msgSend_readApdu(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readApdu");
}

id objc_msgSend_readerConfigID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readerConfigID");
}

id objc_msgSend_readerIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readerIdentifier");
}

id objc_msgSend_readerInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readerInfo");
}

id objc_msgSend_readerPublicKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readerPublicKey");
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reason");
}

id objc_msgSend_receiverPublicKeyHash(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiverPublicKeyHash");
}

id objc_msgSend_regionString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "regionString");
}

id objc_msgSend_registerAlarm_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerAlarm:handler:");
}

id objc_msgSend_registerCrossPlatformMessageSendHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerCrossPlatformMessageSendHandler:");
}

id objc_msgSend_registerDelegate_forEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerDelegate:forEvent:");
}

id objc_msgSend_registerForAppStateChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForAppStateChanges:");
}

id objc_msgSend_registerFriendSideInvitationUnusableHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerFriendSideInvitationUnusableHandler:");
}

id objc_msgSend_registerFriendSidePasscodeRetryRequestHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerFriendSidePasscodeRetryRequestHandler:");
}

id objc_msgSend_registerFriendSideSharingTestCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerFriendSideSharingTestCompletion:");
}

id objc_msgSend_registerFriendSideSharingTestInvitationUUIDHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerFriendSideSharingTestInvitationUUIDHandler:");
}

id objc_msgSend_registerOnStream_forEvent_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerOnStream:forEvent:handler:");
}

id objc_msgSend_registerOwnerSideInvitationRequestHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerOwnerSideInvitationRequestHandler:");
}

id objc_msgSend_registerOwnerSideSharingTestInvitations_callback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerOwnerSideSharingTestInvitations:callback:");
}

id objc_msgSend_releaseRemoteObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releaseRemoteObject");
}

id objc_msgSend_relyingParty(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relyingParty");
}

id objc_msgSend_relyingPartyAccountHash(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relyingPartyAccountHash");
}

id objc_msgSend_remainingTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remainingTime");
}

id objc_msgSend_remoteObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteObject");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDelegate:");
}

id objc_msgSend_removeDesignation_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDesignation:completion:");
}

id objc_msgSend_removeDesignationWithKeyIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDesignationWithKeyIdentifier:");
}

id objc_msgSend_removeFirstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFirstObject");
}

id objc_msgSend_removeHighPriorityRequestFor_client_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeHighPriorityRequestFor:client:");
}

id objc_msgSend_removeLocalSecureElementIdentityPeerID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeLocalSecureElementIdentityPeerID:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsAtIndexes:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:");
}

id objc_msgSend_removeSession_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSession:withError:");
}

id objc_msgSend_removeTestReporter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeTestReporter");
}

id objc_msgSend_removeWithDesignation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeWithDesignation:");
}

id objc_msgSend_removeWithEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeWithEndpoint:");
}

id objc_msgSend_replaceBytesInRange_withBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceBytesInRange:withBytes:");
}

id objc_msgSend_reportCAEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportCAEvent:");
}

id objc_msgSend_reportUnusableInvitation_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportUnusableInvitation:reason:");
}

id objc_msgSend_requestOwnerPairingWithSession_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestOwnerPairingWithSession:delegate:");
}

id objc_msgSend_requestTapToRadar_client_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestTapToRadar:client:");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reset");
}

id objc_msgSend_resetBytesInRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetBytesInRange:");
}

id objc_msgSend_resetDisconnectionHistoryFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetDisconnectionHistoryFor:");
}

id objc_msgSend_resetLegacyToAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetLegacyToAvailable");
}

id objc_msgSend_resetToEmpty(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetToEmpty");
}

id objc_msgSend_responseWithCipherText_ephemeralPublicKeyData_receiverPublicKeyHash_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseWithCipherText:ephemeralPublicKeyData:receiverPublicKeyHash:");
}

id objc_msgSend_responseWithEndPointAttestationData_encryptionPublicKeyData_encryptedData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseWithEndPointAttestationData:encryptionPublicKeyData:encryptedData:");
}

id objc_msgSend_responseWithSignedData_signature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseWithSignedData:signature:");
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "results");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resume");
}

id objc_msgSend_retryWithBackoff_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retryWithBackoff:");
}

id objc_msgSend_revocationAttestation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "revocationAttestation");
}

id objc_msgSend_revokeRemoteTerminationRequestEndPoints_sesDatabase_identifier_taskID_clientInfo_outError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "revokeRemoteTerminationRequestEndPoints:sesDatabase:identifier:taskID:clientInfo:outError:");
}

id objc_msgSend_revokedEndpointWithPublicKeyIdentifier_appletIdentifier_revocationAttestation_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "revokedEndpointWithPublicKeyIdentifier:appletIdentifier:revocationAttestation:error:");
}

id objc_msgSend_rkeSessionEntitlement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rkeSessionEntitlement");
}

id objc_msgSend_rollback(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rollback");
}

id objc_msgSend_rsaCertificate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rsaCertificate");
}

id objc_msgSend_save_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "save:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:repeats:block:");
}

id objc_msgSend_seToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "seToken");
}

id objc_msgSend_secretKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secretKey");
}

id objc_msgSend_secureElementAttestation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secureElementAttestation");
}

id objc_msgSend_secureElementInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secureElementInfo");
}

id objc_msgSend_secureElementPass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secureElementPass");
}

id objc_msgSend_secureElementService_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secureElementService:reply:");
}

id objc_msgSend_secureElementWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secureElementWithIdentifier:error:");
}

id objc_msgSend_seid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "seid");
}

id objc_msgSend_sendAPDU_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendAPDU:");
}

id objc_msgSend_sendApdu_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendApdu:");
}

id objc_msgSend_sendCrossPlatformSharingMessage_toMailboxIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendCrossPlatformSharingMessage:toMailboxIdentifier:");
}

id objc_msgSend_sendData_toDestinations_priority_options_identifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendData:toDestinations:priority:options:identifier:error:");
}

id objc_msgSend_sendDeviceIntentFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDeviceIntentFor:");
}

id objc_msgSend_sendEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEvent:");
}

id objc_msgSend_sendEvent_fromVehicle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEvent:fromVehicle:");
}

id objc_msgSend_sendEvent_keyIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEvent:keyIdentifier:");
}

id objc_msgSend_sendMessage_toDestinations_priority_options_identifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessage:toDestinations:priority:options:identifier:error:");
}

id objc_msgSend_sendPassthroughWithMessage_clientUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendPassthroughWithMessage:clientUUID:");
}

id objc_msgSend_sendRKERequestWithFunctionIdentifier_actionIdentifier_keyIdentifier_requestType_enduringRequestHandler_authorization_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendRKERequestWithFunctionIdentifier:actionIdentifier:keyIdentifier:requestType:enduringRequestHandler:authorization:completion:");
}

id objc_msgSend_sequenceCounter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sequenceCounter");
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serialNumber");
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "server");
}

id objc_msgSend_serviceError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceError");
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceName");
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceWithDefaultShellEndpoint");
}

id objc_msgSend_ses_map_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ses_map:");
}

id objc_msgSend_ses_withUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ses_withUUIDString:");
}

id objc_msgSend_sessionManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionManager");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set");
}

id objc_msgSend_setAID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAID:");
}

id objc_msgSend_setActivePaymentApplet_keys_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivePaymentApplet:keys:error:");
}

id objc_msgSend_setAdditionalAttestationsDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdditionalAttestationsDict:");
}

id objc_msgSend_setAlarm_secondsFromNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlarm:secondsFromNow:");
}

id objc_msgSend_setAllowsCellularAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsCellularAccess:");
}

id objc_msgSend_setAllowsExpensiveAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsExpensiveAccess:");
}

id objc_msgSend_setAltDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAltDSID:");
}

id objc_msgSend_setAnonymizedDsid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnonymizedDsid:");
}

id objc_msgSend_setAppletLockState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppletLockState:");
}

id objc_msgSend_setAuth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuth:");
}

id objc_msgSend_setAuthority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthority:");
}

id objc_msgSend_setAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvailable:");
}

id objc_msgSend_setBleAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBleAddress:");
}

id objc_msgSend_setBleDCKIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBleDCKIdentifier:");
}

id objc_msgSend_setBleIntroKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBleIntroKey:");
}

id objc_msgSend_setBleOOBKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBleOOBKey:");
}

id objc_msgSend_setBleOOBMasterKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBleOOBMasterKey:");
}

id objc_msgSend_setBleUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBleUUID:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setCarOEMProprietaryData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCarOEMProprietaryData:");
}

id objc_msgSend_setCertificates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCertificates:");
}

id objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClass:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setClientBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientBundleIdentifier:");
}

id objc_msgSend_setClientName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientName:");
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfiguration:");
}

id objc_msgSend_setConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnection:");
}

id objc_msgSend_setContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContext:");
}

id objc_msgSend_setCredentialIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCredentialIdentifier:");
}

id objc_msgSend_setCurrentCompatibilityVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentCompatibilityVersion:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDesignation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDesignation:");
}

id objc_msgSend_setDesignation_designation_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDesignation:designation:completion:");
}

id objc_msgSend_setDeviceConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceConfiguration:");
}

id objc_msgSend_setDeviceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceType:");
}

id objc_msgSend_setDidEndCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidEndCallback:");
}

id objc_msgSend_setDiscretionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscretionary:");
}

id objc_msgSend_setDoNotBlockBeforeFirstUnlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDoNotBlockBeforeFirstUnlock:");
}

id objc_msgSend_setDownloadTimeoutInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloadTimeoutInterval:");
}

id objc_msgSend_setEndPointCAData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndPointCAData:");
}

id objc_msgSend_setEndPointData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndPointData:");
}

id objc_msgSend_setEndowmentNamespaces_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndowmentNamespaces:");
}

id objc_msgSend_setEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndpoint:");
}

id objc_msgSend_setEndpointId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndpointId:");
}

id objc_msgSend_setEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnvironment:");
}

id objc_msgSend_setEpAuthResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpAuthResponse:");
}

id objc_msgSend_setErrorCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setErrorCount:");
}

id objc_msgSend_setEventPublisher_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventPublisher:");
}

id objc_msgSend_setEventPublisherQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventPublisherQueue:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFirstLaunchAfterBootDoneForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstLaunchAfterBootDoneForKey:");
}

id objc_msgSend_setFriendlyName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFriendlyName:");
}

id objc_msgSend_setHTTPBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPBody:");
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPMethod:");
}

id objc_msgSend_setHandoffToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandoffToken:");
}

id objc_msgSend_setHomeUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHomeUUIDString:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIncludeUntrustedDevices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludeUntrustedDevices:");
}

id objc_msgSend_setInstance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInstance:");
}

id objc_msgSend_setInstanceRepresentations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInstanceRepresentations:");
}

id objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterface:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setInvitationIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvitationIdentifier:");
}

id objc_msgSend_setIsBackgrounded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsBackgrounded:");
}

id objc_msgSend_setIsWaitingForSecureElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsWaitingForSecureElement:");
}

id objc_msgSend_setKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKey:");
}

id objc_msgSend_setKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeys:");
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLength:");
}

id objc_msgSend_setLengthConfidentialMailBox_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLengthConfidentialMailBox:");
}

id objc_msgSend_setLengthPrivateMailBox_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLengthPrivateMailBox:");
}

id objc_msgSend_setLocalSecureElementIdentity_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalSecureElementIdentity:error:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setLongTermSharedSecret_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLongTermSharedSecret:");
}

id objc_msgSend_setMailboxMapping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMailboxMapping:");
}

id objc_msgSend_setMailboxSizesPlusAdditionalData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMailboxSizesPlusAdditionalData:");
}

id objc_msgSend_setMetadataQueryInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadataQueryInterval:");
}

id objc_msgSend_setMobileAssetManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMobileAssetManager:");
}

id objc_msgSend_setNfcExpressOnlyInLPM_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNfcExpressOnlyInLPM:");
}

id objc_msgSend_setNumCertificateAuthorityIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumCertificateAuthorityIdentifier:");
}

id objc_msgSend_setNumEndPointIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumEndPointIdentifier:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOffsetConfidentialMailBox_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOffsetConfidentialMailBox:");
}

id objc_msgSend_setOffsetPrivateMailBox_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOffsetPrivateMailBox:");
}

id objc_msgSend_setOperatingSystems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOperatingSystems:");
}

id objc_msgSend_setOwnerCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOwnerCompletionHandler:");
}

id objc_msgSend_setOwnerEphemeralKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOwnerEphemeralKey:");
}

id objc_msgSend_setOwnerIDSIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOwnerIDSIdentifier:");
}

id objc_msgSend_setPersistentStoreCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersistentStoreCoordinator:");
}

id objc_msgSend_setPreregistered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreregistered:");
}

id objc_msgSend_setPrivacyEncryptionPK_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrivacyEncryptionPK:");
}

id objc_msgSend_setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueue:");
}

id objc_msgSend_setQueueKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueueKey:");
}

id objc_msgSend_setReaderConfigID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReaderConfigID:");
}

id objc_msgSend_setReaderInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReaderInfo:");
}

id objc_msgSend_setReaderLongTermPublicKeyCertificate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReaderLongTermPublicKeyCertificate:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRequiresPowerPluggedIn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresPowerPluggedIn:");
}

id objc_msgSend_setRetryInProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRetryInProgress:");
}

id objc_msgSend_setRevocationAttestation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRevocationAttestation:");
}

id objc_msgSend_setSESServerDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSESServerDelegate:");
}

id objc_msgSend_setSeToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeToken:");
}

id objc_msgSend_setServices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServices:");
}

id objc_msgSend_setSharedCredentialIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSharedCredentialIdentifier:");
}

id objc_msgSend_setSharingAttestationData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSharingAttestationData:");
}

id objc_msgSend_setSharingEncryptedData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSharingEncryptedData:");
}

id objc_msgSend_setSharingSessionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSharingSessionIdentifier:");
}

id objc_msgSend_setSharingSessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSharingSessionUUID:");
}

id objc_msgSend_setSharingTokenAvailabilityBitmap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSharingTokenAvailabilityBitmap:");
}

id objc_msgSend_setSignatureVerificationPK_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignatureVerificationPK:");
}

id objc_msgSend_setSlot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSlot:");
}

id objc_msgSend_setSlotIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSlotIdentifier:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:");
}

id objc_msgSend_setStateDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStateDescriptor:");
}

id objc_msgSend_setSupportedRKEFunctions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportedRKEFunctions:");
}

id objc_msgSend_setTerminatedByTaskID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTerminatedByTaskID:");
}

id objc_msgSend_setTerminationNotPersisted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTerminationNotPersisted:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setTimeoutInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutInterval:");
}

id objc_msgSend_setTimeoutIntervalForResource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutIntervalForResource:");
}

id objc_msgSend_setTrackingReceipt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrackingReceipt:");
}

id objc_msgSend_setTrackingRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrackingRequest:");
}

id objc_msgSend_setUpdateHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateHandler:");
}

id objc_msgSend_setUpgradeEndpointJSONData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpgradeEndpointJSONData:");
}

id objc_msgSend_setUseCachedAccountStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseCachedAccountStatus:");
}

id objc_msgSend_setUserDefaults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserDefaults:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setUserInitiated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInitiated:");
}

id objc_msgSend_setUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUuid:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_setValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues:");
}

id objc_msgSend_setVehicleSupportedVersionsData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVehicleSupportedVersionsData:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setWithSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithSet:");
}

id objc_msgSend_sha1(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sha1");
}

id objc_msgSend_sha256(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sha256");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shared");
}

id objc_msgSend_sharedDataAccessor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedDataAccessor");
}

id objc_msgSend_sharedDefaultEvaluator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedDefaultEvaluator");
}

id objc_msgSend_sharedHardwareManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedHardwareManager");
}

id objc_msgSend_sharedHardwareManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedHardwareManager:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedLibrary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedLibrary");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_sharedObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedObject");
}

id objc_msgSend_sharedRemoteAdminManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedRemoteAdminManager");
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedSession");
}

id objc_msgSend_sharedVersionsOverrides(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedVersionsOverrides");
}

id objc_msgSend_sharingAttestationData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharingAttestationData");
}

id objc_msgSend_sharingCompleteForInvitationIdentifier_friendKeyIdentifier_status_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharingCompleteForInvitationIdentifier:friendKeyIdentifier:status:");
}

id objc_msgSend_sharingEncryptedData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharingEncryptedData");
}

id objc_msgSend_sharingIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharingIdentifier");
}

id objc_msgSend_sharingRecords(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharingRecords");
}

id objc_msgSend_sharingSessionIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharingSessionIdentifier");
}

id objc_msgSend_sharingSessionUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharingSessionUUID");
}

id objc_msgSend_sharingTokenAvailabilityBitmap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharingTokenAvailabilityBitmap");
}

id objc_msgSend_shortValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shortValue");
}

id objc_msgSend_shouldDefer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldDefer");
}

id objc_msgSend_signature(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signature");
}

id objc_msgSend_signature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signature:");
}

id objc_msgSend_signatureError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signatureError");
}

id objc_msgSend_signatureVerificationPK(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signatureVerificationPK");
}

id objc_msgSend_signedData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signedData");
}

id objc_msgSend_signingKeyType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signingKeyType");
}

id objc_msgSend_singleton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "singleton");
}

id objc_msgSend_slot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "slot");
}

id objc_msgSend_slotIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "slotIdentifier");
}

id objc_msgSend_slotNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "slotNumber");
}

id objc_msgSend_stageEndPointEntityUpdates_fromEndPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stageEndPointEntityUpdates:fromEndPoint:");
}

id objc_msgSend_stageEndPointEntityWithIdentifier_endPointCAEntity_airInstanceEntity_clientName_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stageEndPointEntityWithIdentifier:endPointCAEntity:airInstanceEntity:clientName:error:");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "start");
}

id objc_msgSend_startBackGroundTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startBackGroundTimer");
}

id objc_msgSend_startCardEmulation_authorization_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startCardEmulation:authorization:");
}

id objc_msgSend_startCatalogDownload_options_then_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startCatalogDownload:options:then:");
}

id objc_msgSend_startDownload_then_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDownload:then:");
}

id objc_msgSend_startEmulation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startEmulation");
}

id objc_msgSend_startFirstApproachFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startFirstApproachFor:");
}

id objc_msgSend_startFirstApproachForKeyWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startFirstApproachForKeyWithIdentifier:");
}

id objc_msgSend_startHceEmulation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startHceEmulation");
}

id objc_msgSend_startLPEMConfigSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startLPEMConfigSession:");
}

id objc_msgSend_startLoyaltyAndContactlessPaymentSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startLoyaltyAndContactlessPaymentSession:");
}

id objc_msgSend_startSecureElementAndHCESession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startSecureElementAndHCESession:");
}

id objc_msgSend_startSecureElementManagerSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startSecureElementManagerSession:");
}

id objc_msgSend_startService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startService");
}

id objc_msgSend_startTransactionEmulationFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTransactionEmulationFor:");
}

id objc_msgSend_startWithModule_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startWithModule:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "state");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusCode");
}

id objc_msgSend_stepForAnalytics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stepForAnalytics");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stop");
}

id objc_msgSend_stopCardEmulation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopCardEmulation");
}

id objc_msgSend_stopEmulation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopEmulation");
}

id objc_msgSend_stopHceEmulation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopHceEmulation");
}

id objc_msgSend_stopOwnerPairing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopOwnerPairing");
}

id objc_msgSend_stopService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopService");
}

id objc_msgSend_stopTransactionEmulation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopTransactionEmulation");
}

id objc_msgSend_stopWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopWithError:");
}

id objc_msgSend_storeKeyWithRelyingParty_relyingPartyAccountHash_fidoKeyHash_keyData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeKeyWithRelyingParty:relyingPartyAccountHash:fidoKeyHash:keyData:error:");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithAsciiData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithAsciiData:");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_strongToWeakObjectsMapTable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "strongToWeakObjectsMapTable");
}

id objc_msgSend_subCAAttestation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subCAAttestation");
}

id objc_msgSend_subcredentials(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subcredentials");
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subdataWithRange:");
}

id objc_msgSend_subjectIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subjectIdentifier");
}

id objc_msgSend_subscribeToVehicleFunctionStatusEventsWithRange_peerUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeToVehicleFunctionStatusEventsWithRange:peerUUID:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_supportsCapability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsCapability:");
}

id objc_msgSend_supportsPreciseDistanceMeasurement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsPreciseDistanceMeasurement");
}

id objc_msgSend_sync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sync:");
}

id objc_msgSend_syncMobileAssetUserInitiated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncMobileAssetUserInitiated");
}

id objc_msgSend_synchronizable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronizable");
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tag");
}

id objc_msgSend_targetDeviceType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetDeviceType");
}

id objc_msgSend_targetWithPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetWithPid:");
}

id objc_msgSend_taskState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskState");
}

id objc_msgSend_terminationNotPersisted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "terminationNotPersisted");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeZoneWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeZoneWithName:");
}

id objc_msgSend_toID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toID");
}

id objc_msgSend_trackingReceipt(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackingReceipt");
}

id objc_msgSend_trackingRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackingRequest");
}

id objc_msgSend_transceive_callback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transceive:callback:");
}

id objc_msgSend_transceive_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transceive:error:");
}

id objc_msgSend_transceive_forSEID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transceive:forSEID:error:");
}

id objc_msgSend_transceive_outError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transceive:outError:");
}

id objc_msgSend_triggerHeadUnitPairingWith_keyIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggerHeadUnitPairingWith:keyIdentifier:");
}

id objc_msgSend_trustedPeerSecureElementIdentities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trustedPeerSecureElementIdentities");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "type");
}

id objc_msgSend_u16BE_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "u16BE:");
}

id objc_msgSend_u32BE_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "u32BE:");
}

id objc_msgSend_u8_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "u8:");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_unblockRangingForReaderIdentifierWithReaderIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unblockRangingForReaderIdentifierWithReaderIdentifier:error:");
}

id objc_msgSend_underlyingErrors(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "underlyingErrors");
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uniqueID");
}

id objc_msgSend_uniqueIDOverride(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uniqueIDOverride");
}

id objc_msgSend_unregisterForAppStateChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterForAppStateChanges:");
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedCharValue");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedShortValue");
}

id objc_msgSend_unspecifiedError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unspecifiedError");
}

id objc_msgSend_updateAllowlistedVehicles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAllowlistedVehicles");
}

id objc_msgSend_updateConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateConfiguration:");
}

id objc_msgSend_updatePassSelectionState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePassSelectionState:");
}

id objc_msgSend_updatePreArmState_for_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePreArmState:for:error:");
}

id objc_msgSend_updateToApplePayView_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateToApplePayView:error:");
}

id objc_msgSend_updateWithEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithEndpoint:");
}

id objc_msgSend_upgradeEndpointJSONData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "upgradeEndpointJSONData");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uppercaseString");
}

id objc_msgSend_userDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userDefaults");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}

id objc_msgSend_usesInterfaceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "usesInterfaceType:");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uuid");
}

id objc_msgSend_validateAuthorizedEndpointConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateAuthorizedEndpointConfig:");
}

id objc_msgSend_validateEntitlements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateEntitlements:");
}

id objc_msgSend_validateEntitlements_appletIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateEntitlements:appletIdentifier:");
}

id objc_msgSend_validateForInsert_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateForInsert:");
}

id objc_msgSend_validatePairing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validatePairing:");
}

id objc_msgSend_validateSEPairings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateSEPairings:");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "value");
}

id objc_msgSend_valueAsUnsignedShort(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueAsUnsignedShort");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueWithDAAvailableVersionUpgrade_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithDAAvailableVersionUpgrade:");
}

id objc_msgSend_vehicleSupportedAppletVersionsTlvAsData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vehicleSupportedAppletVersionsTlvAsData");
}

id objc_msgSend_vehicleSupportedFrameworkVersionsForCA(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vehicleSupportedFrameworkVersionsForCA");
}

id objc_msgSend_vehicleSupportedFrameworkVersionsTlvAsData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vehicleSupportedFrameworkVersionsTlvAsData");
}

id objc_msgSend_vehicleSupportedVersionsData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vehicleSupportedVersionsData");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "version");
}

id objc_msgSend_viewNotSyncedError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewNotSyncedError");
}

id objc_msgSend_wakeUpClientIfBackgrounded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wakeUpClientIfBackgrounded");
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "weakObjectsHashTable");
}

id objc_msgSend_withAppletAID_isSuspended_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withAppletAID:isSuspended:");
}

id objc_msgSend_withAuthorizationID_authorizationInterval_authorizationCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withAuthorizationID:authorizationInterval:authorizationCount:");
}

id objc_msgSend_withCKKSExternalKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withCKKSExternalKey:");
}

id objc_msgSend_withCipherText_authenticationTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withCipherText:authenticationTag:");
}

id objc_msgSend_withConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withConnection:");
}

id objc_msgSend_withData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withData:error:");
}

id objc_msgSend_withKeyData_state_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withKeyData:state:");
}

id objc_msgSend_withKeySlot_key_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withKeySlot:key:");
}

id objc_msgSend_withPublicKeyData_CASDSignature_keySlot_legacyKeyAttestation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withPublicKeyData:CASDSignature:keySlot:legacyKeyAttestation:");
}

id objc_msgSend_withRelyingParty_relyingPartyAccountHash_fidoKeyHash_fidoAssertion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withRelyingParty:relyingPartyAccountHash:fidoKeyHash:fidoAssertion:");
}

id objc_msgSend_withRelyingParty_relyingPartyAccountHash_fidoPublicKey_fidoAttestation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withRelyingParty:relyingPartyAccountHash:fidoPublicKey:fidoAttestation:");
}

id objc_msgSend_withSEID_casdCertificate_casdCertificateRSA_isProd_isSkyOrLater_secureElementType_csn_chipID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withSEID:casdCertificate:casdCertificateRSA:isProd:isSkyOrLater:secureElementType:csn:chipID:");
}

id objc_msgSend_withSignature_localValidationVerified_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withSignature:localValidationVerified:");
}

id objc_msgSend_withState_passConfigs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withState:passConfigs:");
}

id objc_msgSend_withState_remaningCount_remainingTime_publicKeyIdentifier_authorizationID_anonymizedDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withState:remaningCount:remainingTime:publicKeyIdentifier:authorizationID:anonymizedDSID:");
}

id objc_msgSend_withSubCAAttestation_casdECDSACertificate_casdRSACertificate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withSubCAAttestation:casdECDSACertificate:casdRSACertificate:");
}

id objc_msgSend_withViewName_currentTLK_tlkShares_previousTLKs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withViewName:currentTLK:tlkShares:previousTLKs:");
}

