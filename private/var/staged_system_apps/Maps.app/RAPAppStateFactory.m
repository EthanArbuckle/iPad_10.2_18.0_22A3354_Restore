@implementation RAPAppStateFactory

+ (void)createAppStateWithMapView:(id)a3 traits:(id)a4 place:(id)a5 searchDataSource:(id)a6 directionsDataSource:(id)a7 completion:(id)a8
{
  +[RAPAppStateFactory createAppStateWithMapView:traits:place:searchDataSource:directionsDataSource:shouldLoadHomeWorkShortcuts:completion:](RAPAppStateFactory, "createAppStateWithMapView:traits:place:searchDataSource:directionsDataSource:shouldLoadHomeWorkShortcuts:completion:", a3, a4, a5, a6, a7, 0, a8);
}

+ (void)createAppStateWithMapView:(id)a3 traits:(id)a4 place:(id)a5 searchDataSource:(id)a6 directionsDataSource:(id)a7 shouldLoadHomeWorkShortcuts:(BOOL)a8 completion:(id)a9
{
  _BOOL4 v9;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD block[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD *v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD *v45;
  _QWORD *v46;
  _QWORD *v47;
  BOOL v48;
  _QWORD v49[4];
  NSObject *v50;
  _QWORD *v51;
  _QWORD *v52;
  _QWORD *v53;
  _QWORD v54[4];
  NSObject *v55;
  _QWORD *v56;
  _QWORD v57[4];
  NSObject *v58;
  _QWORD *v59;
  _QWORD v60[4];
  NSObject *v61;
  _QWORD *v62;
  _QWORD v63[5];
  id v64;
  _QWORD v65[5];
  id v66;
  _QWORD v67[5];
  id v68;
  _QWORD v69[5];
  id v70;
  _QWORD v71[5];
  id v72;
  _QWORD v73[5];
  id v74;

  v9 = a8;
  v34 = a3;
  v33 = a4;
  v32 = a5;
  v31 = a6;
  v14 = a7;
  v15 = a9;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x3032000000;
  v73[3] = sub_100AD0668;
  v73[4] = sub_100AD0678;
  v74 = 0;
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x3032000000;
  v71[3] = sub_100AD0668;
  v71[4] = sub_100AD0678;
  v72 = 0;
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x3032000000;
  v69[3] = sub_100AD0668;
  v69[4] = sub_100AD0678;
  v70 = 0;
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x3032000000;
  v67[3] = sub_100AD0668;
  v67[4] = sub_100AD0678;
  v68 = 0;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x3032000000;
  v65[3] = sub_100AD0668;
  v65[4] = sub_100AD0678;
  v66 = 0;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x3032000000;
  v63[3] = sub_100AD0668;
  v63[4] = sub_100AD0678;
  v64 = 0;
  v16 = dispatch_group_create();
  dispatch_group_enter(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[RAPStorageHistoryContainer searchRecordingStorage](RAPStorageHistoryContainer, "searchRecordingStorage"));
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_100AD0680;
  v60[3] = &unk_1011C5CC8;
  v62 = v73;
  v18 = v16;
  v61 = v18;
  +[HistoryRAPUserSearch loadAllSearchesFromStorage:completion:](HistoryRAPUserSearch, "loadAllSearchesFromStorage:completion:", v17, v60);

  dispatch_group_enter(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[RAPStorageHistoryContainer directionsRecordingStorage](RAPStorageHistoryContainer, "directionsRecordingStorage"));
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_100AD06CC;
  v57[3] = &unk_1011C5CC8;
  v59 = v71;
  v20 = v18;
  v58 = v20;
  +[HistoryRAPUserDirectionRequest loadAllRequestsFromStorage:completion:](HistoryRAPUserDirectionRequest, "loadAllRequestsFromStorage:completion:", v19, v57);

  dispatch_group_enter(v20);
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_100AD0718;
  v54[3] = &unk_1011E1DD0;
  v56 = v69;
  v21 = v20;
  v55 = v21;
  +[RAPAuxiliaryControlsRecorder fetchCurrentlyConnectedControlsWithCompletion:](RAPAuxiliaryControlsRecorder, "fetchCurrentlyConnectedControlsWithCompletion:", v54);
  if (v9)
  {
    dispatch_group_enter(v21);
    v22 = sub_100B3A5D4();
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "oneFavorites"));

    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_100AD0764;
    v49[3] = &unk_1011E1DF8;
    v51 = v67;
    v52 = v65;
    v53 = v63;
    v50 = v21;
    objc_msgSend(v24, "loadAllShortcutsWithHandler:", v49);

  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100AD08FC;
  block[3] = &unk_1011E1E48;
  v48 = v9;
  v36 = v34;
  v37 = v33;
  v42 = v73;
  v43 = v71;
  v38 = v32;
  v39 = v31;
  v44 = v69;
  v45 = v67;
  v46 = v65;
  v47 = v63;
  v40 = v14;
  v41 = v15;
  v25 = v15;
  v26 = v14;
  v27 = v31;
  v28 = v32;
  v29 = v33;
  v30 = v34;
  dispatch_group_notify(v21, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(v63, 8);
  _Block_object_dispose(v65, 8);

  _Block_object_dispose(v67, 8);
  _Block_object_dispose(v69, 8);

  _Block_object_dispose(v71, 8);
  _Block_object_dispose(v73, 8);

}

+ (void)createAppStateWithMapView:(id)a3 lookAroundContext:(id)a4 traits:(id)a5 completion:(id)a6
{
  void (**v9)(id, RAPAppState *);
  id v10;
  id v11;
  id v12;
  RAPAppState *v13;

  v9 = (void (**)(id, RAPAppState *))a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[RAPAppState initWithMapView:lookAroundContext:traits:]([RAPAppState alloc], "initWithMapView:lookAroundContext:traits:", v12, v11, v10);

  v9[2](v9, v13);
}

+ (void)createAppStateWithTraits:(id)a3 curatedCollectionContext:(id)a4 completion:(id)a5
{
  void (**v7)(id, RAPAppState *);
  id v8;
  id v9;
  RAPAppState *v10;

  v7 = (void (**)(id, RAPAppState *))a5;
  v8 = a4;
  v9 = a3;
  v10 = -[RAPAppState initWithTraits:curatedCollectionContext:]([RAPAppState alloc], "initWithTraits:curatedCollectionContext:", v9, v8);

  v7[2](v7, v10);
}

@end
