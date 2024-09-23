@implementation SKEraseDisk

- (id)createStateMachineWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  _QWORD *v20;
  SKStateTransitionEntry *v21;
  void *v22;
  SKStateTransitionEntry *v23;
  void *v24;
  SKStateTransitionEntry *v25;
  void *v26;
  void *v27;
  SKStateTransitionEntry *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD v41[5];
  __CFString *v42;
  _QWORD v43[5];
  __CFString *v44;
  _QWORD v45[5];
  __CFString *v46;
  _QWORD v47[5];
  __CFString *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[5];
  _BYTE v54[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseDisk disk](self, "disk"));

  if (v5)
    goto LABEL_3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseDisk diskRepresentation](self, "diskRepresentation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "knownDiskForDictionary:", v7));
  -[SKEraseDisk setDisk:](self, "setDisk:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseDisk disk](self, "disk"));
  if (v9)
  {
LABEL_3:
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseDisk validateWithError:](self, "validateWithError:", a3));

    if (v10)
    {
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseDisk descriptors](self, "descriptors"));
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v50;
        while (2)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v50 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "filesystem"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "name"));
            v19 = objc_msgSend(v17, "isValidName:error:", v18, a3);

            if (!v19)
            {

              goto LABEL_14;
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
          if (v13)
            continue;
          break;
        }
      }

      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_100008A4C;
      v47[3] = &unk_100044C68;
      v47[4] = self;
      v48 = CFSTR("done");
      v40 = objc_retainBlock(v47);
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_100008D08;
      v45[3] = &unk_100044C68;
      v45[4] = self;
      v46 = CFSTR("done");
      v39 = objc_retainBlock(v45);
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_1000090A0;
      v43[3] = &unk_100044C68;
      v43[4] = self;
      v44 = CFSTR("done");
      v38 = objc_retainBlock(v43);
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_1000092BC;
      v41[3] = &unk_100044C68;
      v41[4] = self;
      v42 = CFSTR("done");
      v20 = objc_retainBlock(v41);
      v21 = sub_10000A200((uint64_t)CFSTR("begin"), (uint64_t)CFSTR("begin"), (uint64_t)v40, (uint64_t)CFSTR("repartitioned"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v53[0] = v22;
      v23 = sub_10000A200((uint64_t)CFSTR("repartitioned"), (uint64_t)CFSTR("done"), (uint64_t)v39, (uint64_t)CFSTR("newfsed"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v53[1] = v24;
      v25 = sub_10000A200((uint64_t)CFSTR("newfsed"), (uint64_t)CFSTR("done"), (uint64_t)v38, (uint64_t)CFSTR("reprobed"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v53[2] = v26;
      v27 = v20;
      v28 = sub_10000A200((uint64_t)CFSTR("reprobed"), (uint64_t)CFSTR("done"), (uint64_t)v20, (uint64_t)CFSTR("unmountedState"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v53[3] = v29;
      v30 = sub_10000A250((uint64_t)CFSTR("unmountedState"), (uint64_t)CFSTR("done"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      v53[4] = v31;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v53, 5));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[SKStateTransitionTable tableWithTransitionEntries:](SKStateTransitionTable, "tableWithTransitionEntries:", v32));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[SKStateMachine machineWithStateTransitionTable:startState:startEvent:](SKStateMachine, "machineWithStateTransitionTable:startState:startEvent:", v33, CFSTR("begin"), CFSTR("begin")));

    }
    else
    {
LABEL_14:
      v34 = 0;
    }
  }
  else
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseDisk diskRepresentation](self, "diskRepresentation"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](SKError, "errorWithCode:userInfo:", 117, v36));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[SKError nilWithError:error:](SKError, "nilWithError:error:", v37, a3));

  }
  return v34;
}

@end
