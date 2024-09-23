@implementation MediaLibraryItem

- (NSDictionary)mediaLibraryDictionary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSDictionary *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSMutableDictionary *v73;
  NSMutableDictionary *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  _QWORD v90[4];
  NSMutableDictionary *v91;
  _QWORD v92[61];
  _QWORD v93[61];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MediaLibraryItem hasVideo](self, "hasVideo"));
  if (objc_msgSend(v3, "BOOLValue"))
    v4 = 256;
  else
    v4 = 4;

  v73 = objc_opt_new(NSMutableDictionary);
  v92[0] = &off_1004D60D0;
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[MediaLibraryItem dateAccessed](self, "dateAccessed"));
  v93[0] = v86;
  v92[1] = &off_1004D60E8;
  v5 = objc_claimAutoreleasedReturnValue(-[MediaLibraryItem album](self, "album"));
  v85 = (void *)v5;
  if (!v5)
    v5 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v60 = (void *)v5;
  v93[1] = v5;
  v92[2] = &off_1004D6100;
  v6 = objc_claimAutoreleasedReturnValue(-[MediaLibraryItem title](self, "title"));
  v7 = (void *)v6;
  if (!v6)
    v6 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v59 = (void *)v6;
  v93[2] = v6;
  v92[3] = &off_1004D6118;
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[MediaLibraryItem fileSize](self, "fileSize"));
  v93[3] = v83;
  v92[4] = &off_1004D6130;
  v8 = objc_claimAutoreleasedReturnValue(-[MediaLibraryItem externalGuid](self, "externalGuid"));
  v9 = (void *)v8;
  if (!v8)
    v8 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v58 = (void *)v8;
  v93[4] = v8;
  v92[5] = &off_1004D6148;
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[MediaLibraryItem bookmarkTimeMillis](self, "bookmarkTimeMillis"));
  v93[5] = v81;
  v92[6] = &off_1004D6160;
  v10 = objc_claimAutoreleasedReturnValue(-[MediaLibraryItem seriesName](self, "seriesName"));
  v80 = (void *)v10;
  if (!v10)
    v10 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v84 = v7;
  v57 = (void *)v10;
  v93[6] = v10;
  v92[7] = &off_1004D6178;
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[MediaLibraryItem totalTimeMillis](self, "totalTimeMillis"));
  v93[7] = v79;
  v92[8] = &off_1004D6190;
  v11 = objc_claimAutoreleasedReturnValue(-[MediaLibraryItem itemDescription](self, "itemDescription"));
  v12 = (void *)v11;
  if (!v11)
    v11 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v56 = (void *)v11;
  v93[8] = v11;
  v92[9] = &off_1004D61A8;
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v4));
  v93[9] = v77;
  v92[10] = &off_1004D61C0;
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[MediaLibraryItem hasVideo](self, "hasVideo"));
  v93[10] = v76;
  v92[11] = &off_1004D61D8;
  v13 = objc_claimAutoreleasedReturnValue(-[MediaLibraryItem feedUrl](self, "feedUrl"));
  v14 = (void *)v13;
  if (!v13)
    v13 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v55 = (void *)v13;
  v93[11] = v13;
  v92[12] = &off_1004D61F0;
  v15 = objc_claimAutoreleasedReturnValue(-[MediaLibraryItem itemDescription](self, "itemDescription"));
  v16 = (void *)v15;
  if (!v15)
    v15 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v54 = (void *)v15;
  v93[12] = v15;
  v92[13] = &off_1004D6208;
  v17 = objc_claimAutoreleasedReturnValue(-[MediaLibraryItem playlistId](self, "playlistId"));
  v18 = (void *)v17;
  if (!v17)
    v17 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v53 = (void *)v17;
  v93[13] = v17;
  v92[14] = &off_1004D6220;
  v19 = objc_claimAutoreleasedReturnValue(-[MediaLibraryItem dateReleased](self, "dateReleased"));
  v20 = (void *)v19;
  if (!v19)
    v19 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v52 = (void *)v19;
  v93[14] = v19;
  v92[15] = &off_1004D6238;
  v21 = objc_claimAutoreleasedReturnValue(-[MediaLibraryItem artist](self, "artist"));
  v22 = (void *)v21;
  if (!v21)
    v21 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v51 = (void *)v21;
  v93[15] = v21;
  v92[16] = &off_1004D6250;
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[MediaLibraryItem totalTimeMillis](self, "totalTimeMillis"));
  v93[16] = v68;
  v92[17] = &off_1004D6268;
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v4));
  v93[17] = v67;
  v92[18] = &off_1004D6280;
  v23 = objc_claimAutoreleasedReturnValue(-[MediaLibraryItem activeDsid](self, "activeDsid"));
  v89 = (void *)v23;
  if (!v23)
    v23 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v50 = (void *)v23;
  v93[18] = v23;
  v92[19] = &off_1004D6298;
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[MediaLibraryItem playCount](self, "playCount"));
  v93[19] = v66;
  v92[20] = &off_1004D62B0;
  v24 = objc_claimAutoreleasedReturnValue(-[MediaLibraryItem serpentId](self, "serpentId"));
  v88 = (void *)v24;
  if (!v24)
    v24 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v49 = (void *)v24;
  v93[20] = v24;
  v92[21] = &off_1004D62C8;
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[MediaLibraryItem hasBeenPlayed](self, "hasBeenPlayed"));
  v93[21] = v65;
  v92[22] = &off_1004D62E0;
  v25 = objc_claimAutoreleasedReturnValue(-[MediaLibraryItem activeDsid](self, "activeDsid"));
  v87 = (void *)v25;
  if (!v25)
    v25 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v78 = v12;
  v48 = (void *)v25;
  v93[22] = v25;
  v92[23] = &off_1004D62F8;
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[MediaLibraryItem playCount](self, "playCount"));
  v93[23] = v64;
  v92[24] = &off_1004D6310;
  v26 = objc_claimAutoreleasedReturnValue(-[MediaLibraryItem itemFilePath](self, "itemFilePath"));
  v63 = (void *)v26;
  if (!v26)
    v26 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v82 = v9;
  v47 = (void *)v26;
  v93[24] = v26;
  v92[25] = &off_1004D6328;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[MediaLibraryItem statsDownloadIdentifier](self, "statsDownloadIdentifier"));
  v93[25] = v62;
  v92[26] = &off_1004D6340;
  v27 = objc_claimAutoreleasedReturnValue(-[MediaLibraryItem dateReleased](self, "dateReleased"));
  v28 = (void *)v27;
  if (!v27)
    v27 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v69 = v22;
  v70 = v20;
  v71 = v18;
  v72 = v16;
  v75 = v14;
  v46 = (void *)v27;
  v93[26] = v27;
  v92[27] = &off_1004D6358;
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[MediaLibraryItem artworkTokenId](self, "artworkTokenId"));
  v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "stringValue"));
  v30 = (void *)v29;
  if (!v29)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "UUIDString"));
  }
  v45 = (void *)v29;
  v93[27] = v29;
  v92[28] = &off_1004D6370;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[MediaLibraryItem remeberBookmark](MediaLibraryItem, "remeberBookmark"));
  v93[28] = v31;
  v92[29] = &off_1004D6388;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[MediaLibraryItem playbackStart](MediaLibraryItem, "playbackStart"));
  v93[29] = v32;
  v92[30] = &off_1004D63A0;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[MediaLibraryItem isOTAPurchased](MediaLibraryItem, "isOTAPurchased"));
  v93[30] = v33;
  v92[31] = &off_1004D63B8;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[MediaLibraryItem needsRestore](MediaLibraryItem, "needsRestore"));
  v93[31] = v34;
  v92[32] = &off_1004D63D0;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[MediaLibraryItem chosenByAutofill](MediaLibraryItem, "chosenByAutofill"));
  v93[32] = v35;
  v92[33] = &off_1004D63E8;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[MediaLibraryItem isCompilation](MediaLibraryItem, "isCompilation"));
  v93[33] = v36;
  v92[34] = &off_1004D6400;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[MediaLibraryItem playbackRelativeVolume](MediaLibraryItem, "playbackRelativeVolume"));
  v93[34] = v37;
  v93[35] = &off_1004D6430;
  v92[35] = &off_1004D6418;
  v92[36] = &off_1004D6448;
  v93[36] = &off_1004D6460;
  v93[37] = &off_1004D6460;
  v92[37] = &off_1004D6478;
  v92[38] = &off_1004D6490;
  v93[38] = &off_1004D6460;
  v93[39] = &off_1004D6460;
  v92[39] = &off_1004D64A8;
  v92[40] = &off_1004D64C0;
  v93[40] = &off_1004D6460;
  v93[41] = &off_1004D6460;
  v92[41] = &off_1004D64D8;
  v92[42] = &off_1004D64F0;
  v93[42] = &off_1004D6460;
  v93[43] = &off_1004D6460;
  v92[43] = &off_1004D6508;
  v92[44] = &off_1004D6520;
  v93[44] = &off_1004D6460;
  v93[45] = &off_1004D6460;
  v92[45] = &off_1004D6538;
  v92[46] = &off_1004D6550;
  v93[46] = &off_1004D6460;
  v93[47] = &off_1004D6460;
  v92[47] = &off_1004D6568;
  v92[48] = &off_1004D6580;
  v93[48] = &off_1004D6460;
  v93[49] = &off_1004D6460;
  v92[49] = &off_1004D6598;
  v92[50] = &off_1004D65B0;
  v93[50] = &off_1004D6460;
  v93[51] = &off_1004D6460;
  v92[51] = &off_1004D65C8;
  v92[52] = &off_1004D65E0;
  v93[52] = &off_1004D6460;
  v93[53] = &off_1004D6460;
  v92[53] = &off_1004D65F8;
  v92[54] = &off_1004D6610;
  v93[54] = &off_1004D6460;
  v93[55] = &off_1004D6460;
  v92[55] = &off_1004D6628;
  v92[56] = &off_1004D6640;
  v93[56] = &off_1004D6460;
  v93[57] = &off_1004D6460;
  v92[57] = &off_1004D6658;
  v92[58] = &off_1004D6670;
  v93[58] = &off_1004D6460;
  v93[59] = &off_1004D6460;
  v92[59] = &off_1004D6688;
  v92[60] = &off_1004D66A0;
  v93[60] = &off_1004D6460;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v93, v92, 61));
  v90[0] = _NSConcreteStackBlock;
  v90[1] = 3221225472;
  v90[2] = sub_1001153E0;
  v90[3] = &unk_1004ABB90;
  v74 = v73;
  v91 = v74;
  objc_msgSend(v38, "enumerateKeysAndObjectsUsingBlock:", v90);

  if (!v30)
  {

  }
  if (!v28)

  if (!v63)
  v39 = v87;
  if (!v87)
  {

    v39 = 0;
  }

  v40 = v88;
  if (!v88)
  {

    v40 = 0;
  }

  v41 = v89;
  if (!v89)
  {

    v41 = 0;
  }

  if (!v69)
  if (!v70)

  if (!v71)
  if (!v72)

  if (!v75)
  if (!v78)

  if (!v80)
  if (!v82)

  if (!v84)
  if (!v85)

  v42 = v74;
  return v42;
}

@end
