uint64_t sub_100001B94(int a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  __CFString *v15;
  int v16;
  uint64_t v17;
  void **v18;
  void ***v19;
  _QWORD *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  _QWORD *v35;
  void *v36;
  void *v37;
  id v38;
  int v39;
  id *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
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
  void *v73;
  void *v74;
  _QWORD v75[4];
  NSObject *v76;
  uint64_t *v77;
  _QWORD *v78;
  _QWORD v79[4];
  _QWORD v80[3];
  _QWORD v81[7];
  _QWORD v82[7];
  _QWORD v83[4];
  NSObject *v84;
  uint64_t *v85;
  _QWORD *v86;
  _QWORD v87[3];
  char v88;
  _QWORD v89[6];
  _QWORD v90[6];
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t (*v94)(uint64_t, uint64_t);
  void (*v95)(uint64_t);
  id v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t (*v100)(uint64_t, uint64_t);
  void (*v101)(uint64_t);
  id v102;
  void **v103;
  void **v104;
  _QWORD v105[5];
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  char v109;
  uint64_t v110;
  uint64_t *v111;
  uint64_t v112;
  char v113;
  _QWORD v114[6];
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t (*v118)(uint64_t, uint64_t);
  void (*v119)(uint64_t);
  id v120;
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  uint64_t (*v124)(uint64_t, uint64_t);
  void (*v125)(uint64_t);
  id v126;

  v121 = 0;
  v122 = &v121;
  v123 = 0x3032000000;
  v124 = sub_100002A14;
  v125 = sub_100002A24;
  v126 = 0;
  v115 = 0;
  v116 = &v115;
  v117 = 0x3032000000;
  v118 = sub_100002A14;
  v119 = sub_100002A24;
  v120 = 0;
  if (!objc_opt_class(FSClient))
  {
    v7 = 0;
    v8 = 0;
    v13 = 45;
    goto LABEL_29;
  }
  v7 = (void *)objc_opt_new(FSClient);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *a4));
  v114[0] = _NSConcreteStackBlock;
  v114[1] = 3221225472;
  v114[2] = sub_100002A2C;
  v114[3] = &unk_100008478;
  v114[4] = &v121;
  v114[5] = &v115;
  objc_msgSend(v7, "installedExtensionWithShortName:synchronous:replyHandler:", v8, 1, v114);
  v9 = (void *)v116[5];
  if (!v9)
  {
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v122[5], "attributes"));
    if (a1)
    {
      if (a1 == 1)
      {
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "objectForKeyedSubscript:", FSActivateOptionSyntaxKey));
        v15 = CFSTR("mount");
        v16 = 2;
        if (v14)
        {
LABEL_17:
          v73 = (void *)v14;
          v110 = 0;
          v111 = &v110;
          v112 = 0x2020000000;
          v113 = 0;
          v106 = 0;
          v107 = &v106;
          v108 = 0x2020000000;
          v109 = 0;
          +[FSTaskOptionsBundle resetOptionEnumeration](FSTaskOptionsBundle, "resetOptionEnumeration");
          v105[0] = _NSConcreteStackBlock;
          v105[1] = 3221225472;
          v105[2] = sub_100005B18;
          v105[3] = &unk_1000084A0;
          v105[4] = &v110;
          v72 = (void *)objc_claimAutoreleasedReturnValue(+[FSTaskOptionsBundle bundleForArguments:count:syntaxDictionary:errorHandler:](FSTaskOptionsBundle, "bundleForArguments:count:syntaxDictionary:errorHandler:", a4, a3, v73, v105));
          if (!*((_BYTE *)v111 + 24))
          {
            v17 = optind;
            if ((_DWORD)a3 - optind == v16)
            {
              if (a1 == 2)
              {
                *((_BYTE *)v107 + 24) = 1;
              }
              else
              {
                *((_BYTE *)v107 + 24) = 1;
                if (a1 == 1)
                {
                  v103 = _NSConcreteStackBlock;
                  v18 = (void **)sub_100002AC8;
                  v19 = &v103;
                }
                else
                {
                  v104 = _NSConcreteStackBlock;
                  v18 = (void **)sub_100002AA0;
                  v19 = &v104;
                }
                v19[1] = (void **)3221225472;
                v19[2] = v18;
                v19[3] = (void **)&unk_1000084C8;
                v19[4] = (void **)&v106;
                objc_msgSend(v72, "enumerateOptionsWithBlock:");
              }
              v21 = &a4[v17];
              v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *v21));
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("FSSupportsBlockResources")));
              if (v22 && (v23 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v22, v23) & 1) != 0))
                v13 = (uint64_t)objc_msgSend(v22, "BOOLValue");
              else
                v13 = 0;
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("FSSupportsPathURLs")));

              if (v24 && (v25 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v24, v25) & 1) != 0))
                v26 = objc_msgSend(v24, "BOOLValue");
              else
                v26 = 0;
              if ((_DWORD)v13)
              {
                v70 = (void *)objc_claimAutoreleasedReturnValue(+[FSBlockDeviceResource proxyResourceForBSDName:writable:](FSBlockDeviceResource, "proxyResourceForBSDName:writable:", v71, *((unsigned __int8 *)v107 + 24)));
                v69 = v24;
              }
              else
              {
                if (!v26)
                {
                  warnx("Filesystem %s supports neither Block Device nor PathURL resources.", (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
                  v13 = 22;
                  v28 = v24;
LABEL_84:

                  goto LABEL_27;
                }
                v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("FSRequiresSecurityScopedPathURLResources")));

                if (v69 && (v27 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v69, v27) & 1) != 0))
                  v13 = (uint64_t)objc_msgSend(v69, "BOOLValue");
                else
                  v13 = 0;
                v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v71));
                if ((_DWORD)v13)
                  v70 = (void *)objc_claimAutoreleasedReturnValue(+[FSPathURLResource secureResourceWithURL:readonly:](FSPathURLResource, "secureResourceWithURL:readonly:", v29, *((_BYTE *)v107 + 24) == 0));
                else
                  v70 = (void *)objc_claimAutoreleasedReturnValue(+[FSPathURLResource resourceWithURL:](FSPathURLResource, "resourceWithURL:", v29));

              }
              if (a1 == 1)
                v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v21[1]));
              else
                v30 = 0;
              v67 = (void *)objc_opt_new(FSTaskOptionsBundle);
              v97 = 0;
              v98 = &v97;
              v99 = 0x3032000000;
              v100 = sub_100002A14;
              v101 = sub_100002A24;
              v102 = 0;
              if ((a1 | 2) == 2)
              {
                v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
                v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "fs_containerIdentifier"));

              }
              else
              {
                v91 = 0;
                v92 = &v91;
                v93 = 0x3032000000;
                v94 = sub_100002A14;
                v95 = sub_100002A24;
                v96 = 0;
                v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v122[5], "bundleIdentifier"));
                v90[0] = _NSConcreteStackBlock;
                v90[1] = 3221225472;
                v90[2] = sub_100002B64;
                v90[3] = &unk_1000084F0;
                v90[4] = &v115;
                v90[5] = &v91;
                objc_msgSend(v7, "probeResourceSync:usingBundle:replyHandler:", v70, v36, v90);

                v37 = (void *)v116[5];
                if (v37)
                {
                  v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedDescription")));
                  warnx("Probing resource: %s", (const char *)objc_msgSend(v38, "UTF8String"));

                  v39 = 0;
                  v66 = 0;
                  v13 = 5;
                }
                else
                {
                  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v92[5], "containerID"));
                  v89[0] = _NSConcreteStackBlock;
                  v89[1] = 3221225472;
                  v89[2] = sub_100002BD0;
                  v89[3] = &unk_100008518;
                  v89[4] = &v115;
                  v89[5] = &v97;
                  objc_msgSend(v7, "loadResource:shortName:options:synchronousReplyHandler:", v70, v8, v67, v89);
                  v60 = (void *)v116[5];
                  if (v60)
                  {
                    v61 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "localizedDescription")));
                    warnx("Loading resource: %s", (const char *)objc_msgSend(v61, "UTF8String"));

                    v13 = (uint64_t)objc_msgSend((id)v116[5], "code");
                    v39 = 0;
                  }
                  else
                  {
                    v39 = 1;
                  }
                }
                _Block_object_dispose(&v91, 8);

                if (!v39)
                {
                  v28 = v69;
                  goto LABEL_83;
                }
              }
              v87[0] = 0;
              v87[1] = v87;
              v87[2] = 0x2020000000;
              v88 = 0;
              v83[0] = _NSConcreteStackBlock;
              v83[1] = 3221225472;
              v83[2] = sub_100002C3C;
              v83[3] = &unk_100008540;
              v85 = &v115;
              v86 = v87;
              v32 = dispatch_group_create();
              v84 = v32;
              v33 = (void *)objc_claimAutoreleasedReturnValue(+[FSMessageReceiver receiverForStandardIO:](FSMessageReceiver, "receiverForStandardIO:", v83));
              v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "getConnection"));
              dispatch_group_enter(v32);
              if (a1)
              {
                if (a1 != 2)
                {
                  v59 = (void *)v98[5];
                  if (!v59 || !objc_msgSend(v59, "count"))
                  {
                    warnx("Operation did not add any volumes");
                    v13 = 22;
                    goto LABEL_81;
                  }
                  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v98[5], "objectAtIndexedSubscript:", 0));
                  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "volumeID"));
                  v79[0] = _NSConcreteStackBlock;
                  v79[1] = 3221225472;
                  v79[2] = sub_100002D2C;
                  v79[3] = &unk_100008590;
                  v80[1] = &v115;
                  v80[0] = v32;
                  v80[2] = v87;
                  objc_msgSend(v7, "activateVolume:shortName:options:replyHandler:", v65, v8, v72, v79);
                  v40 = (id *)v80;

LABEL_65:
                  dispatch_group_wait(v32, 0xFFFFFFFFFFFFFFFFLL);
                  v41 = (void *)v116[5];
                  if (v41)
                  {
                    v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "description")));
                    warnx("operation exiting with error %s", (const char *)objc_msgSend(v42, "UTF8String"));

                    v13 = (uint64_t)objc_msgSend((id)v116[5], "code");
                  }
                  else
                  {
                    if (a1 == 1)
                    {
                      v64 = v30;
                      v62 = +[LiveFSMountClient newClientForProvider:](LiveFSMountClient, "newClientForProvider:", CFSTR("com.apple.filesystems.UserFS.FileProvider"));
                      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v98[5], "objectAtIndexedSubscript:", 0));
                      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "volumeID"));
                      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "uuid"));
                      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "description"));

                      if (!objc_msgSend(v64, "length"))
                      {
                        v46 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), CFSTR("com.apple.filesystems.UserFS.FileProvider"), v63));

                        v64 = (void *)v46;
                      }
                      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v98[5], "objectAtIndexedSubscript:", 0));
                      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "volumeName"));
                      v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "mountVolume:fileSystem:displayName:provider:domainError:on:how:options:", v63, v8, v48, CFSTR("com.apple.filesystems.UserFS.FileProvider"), 0, v64, 0, &stru_100008968));
                      v50 = (void *)v116[5];
                      v116[5] = v49;

                      v51 = (void *)v116[5];
                      if (v51)
                      {
                        v91 = 0;
                        v92 = &v91;
                        v93 = 0x3032000000;
                        v94 = sub_100002A14;
                        v95 = sub_100002A24;
                        v96 = 0;
                        v28 = v69;
                        v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "localizedDescription")));
                        warnx("Final mount step ended with error: %s", (const char *)objc_msgSend(v52, "UTF8String"));

                        dispatch_group_enter(v32);
                        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v98[5], "objectAtIndexedSubscript:", 0));
                        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "volumeID"));
                        v55 = (void *)objc_opt_new(FSTaskOptionsBundle);
                        v75[0] = _NSConcreteStackBlock;
                        v75[1] = 3221225472;
                        v75[2] = sub_100002D88;
                        v75[3] = &unk_100008590;
                        v77 = &v91;
                        v56 = v32;
                        v76 = v56;
                        v78 = v87;
                        objc_msgSend(v7, "deactivateVolume:shortName:options:replyHandler:", v54, v8, v55, v75);

                        dispatch_group_wait(v56, 0xFFFFFFFFFFFFFFFFLL);
                        v57 = (void *)v92[5];
                        if (v57)
                        {
                          v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "localizedDescription")));
                          warnx("Final mount step cleanup ended with error: %s", (const char *)objc_msgSend(v58, "UTF8String"));

                        }
                        v13 = (uint64_t)objc_msgSend((id)v116[5], "code");

                        _Block_object_dispose(&v91, 8);
                      }
                      else
                      {

                        v13 = 0;
                        v28 = v69;
                      }
                      v30 = v64;
                      goto LABEL_82;
                    }
                    v13 = 0;
                  }
LABEL_81:
                  v28 = v69;
LABEL_82:

                  _Block_object_dispose(v87, 8);
LABEL_83:
                  _Block_object_dispose(&v97, 8);

                  goto LABEL_84;
                }
                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v122[5], "bundleIdentifier"));
                v82[0] = _NSConcreteStackBlock;
                v82[1] = 3221225472;
                v82[2] = sub_100002CAC;
                v82[3] = &unk_100008568;
                v82[5] = &v115;
                v35 = v82;
                v82[4] = v32;
                v82[6] = v87;
                objc_msgSend(v7, "formatResource:usingBundle:options:connection:replyHandler:", v70, v34, v72, v68, v82);
              }
              else
              {
                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v122[5], "bundleIdentifier"));
                v81[0] = _NSConcreteStackBlock;
                v81[1] = 3221225472;
                v81[2] = sub_100002CEC;
                v81[3] = &unk_100008568;
                v81[5] = &v115;
                v35 = v81;
                v81[4] = v32;
                v81[6] = v87;
                objc_msgSend(v7, "checkResource:usingBundle:options:connection:replyHandler:", v70, v34, v72, v68, v81);
              }
              v40 = (id *)(v35 + 4);
              goto LABEL_65;
            }
            warnx("Argument count %d not equal to expected count %d", a3 - optind, v16);
          }
          v13 = 22;
LABEL_27:
          _Block_object_dispose(&v106, 8);
          _Block_object_dispose(&v110, 8);

          goto LABEL_28;
        }
        goto LABEL_23;
      }
      if (a1 != 2)
      {
        fprintf(__stderrp, "Internal error, operation type %d unrecognized\n", a1);
        v13 = 22;
        goto LABEL_28;
      }
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "objectForKeyedSubscript:", FSFormatOptionSyntaxKey));
      v15 = CFSTR("newfs");
    }
    else
    {
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "objectForKeyedSubscript:", FSCheckOptionSyntaxKey));
      v15 = CFSTR("fsck");
    }
    v16 = 1;
    if (v14)
      goto LABEL_17;
LABEL_23:
    warnx("Filesystem %s does not support operation %s", (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), (const char *)-[__CFString UTF8String](v15, "UTF8String"));
    v13 = 8;
LABEL_28:

    goto LABEL_29;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
  if (!v10)
  {
LABEL_14:
    v13 = 22;
    goto LABEL_29;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v116[5], "domain"));
  if ((objc_msgSend(NSPOSIXErrorDomain, "isEqualToString:", v11) & 1) == 0)
  {

    goto LABEL_14;
  }
  v12 = objc_msgSend((id)v116[5], "code");

  if (v12 == (id)2)
    v13 = 2;
  else
    v13 = 22;
LABEL_29:
  _Block_object_dispose(&v115, 8);

  _Block_object_dispose(&v121, 8);
  return v13;
}

void sub_100002968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  uint64_t v59;

  _Block_object_dispose(&STACK[0x210], 8);
  _Block_object_dispose(&a59, 8);
  _Block_object_dispose(&STACK[0x240], 8);
  _Block_object_dispose(&STACK[0x2E8], 8);
  _Block_object_dispose(&STACK[0x308], 8);
  _Block_object_dispose((const void *)(v59 - 216), 8);
  _Block_object_dispose((const void *)(v59 - 168), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002A14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100002A24(uint64_t a1)
{

}

void sub_100002A2C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

uint64_t sub_100002AA0(uint64_t result, int a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (a2 == 113 || a2 == 110)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
    *a5 = 1;
  }
  return result;
}

void sub_100002AC8(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  char v7;
  unsigned int v8;
  void *v9;

  v5 = a3;
  v6 = v5;
  if (a2 == 111 && v5)
  {
    v9 = v5;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ro")) & 1) != 0
      || (objc_msgSend(v9, "isEqualToString:", CFSTR("rdonly")) & 1) != 0)
    {
      v7 = 0;
      v6 = v9;
    }
    else
    {
      v8 = objc_msgSend(v9, "isEqualToString:", CFSTR("rw"));
      v6 = v9;
      if (!v8)
        goto LABEL_7;
      v7 = 1;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7;
  }
LABEL_7:

}

void sub_100002B64(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void sub_100002BD0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void sub_100002C3C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  if (v3)
  {
    v5 = v3;
    sub_100005B9C();
    v3 = v5;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v4 = v3;
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    v3 = v4;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

void sub_100002CAC(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;

  v3 = a3;
  if (v3)
  {
    v4 = v3;
    sub_100005BE4();
    v3 = v4;
  }

}

void sub_100002CEC(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;

  v3 = a3;
  if (v3)
  {
    v4 = v3;
    sub_100005C48();
    v3 = v4;
  }

}

void sub_100002D2C(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
    sub_100005B9C();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

}

void sub_100002D88(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

}

void sub_100002DE4(id *location, id obj)
{
  objc_storeStrong(location, obj);
}

void sub_100002DF4()
{
  uint64_t v0;
  void *v1;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v0 + 40) + 8) + 40), v1);
}

void sub_100002E08(uint64_t a1@<X8>)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 8) + 24) = 1;
}

id sub_100002E18(void *a1, const char *a2)
{
  return objc_msgSend(a1, "UTF8String");
}

uint64_t sub_100002E20()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)(v0 + 40) + 8) + 40;
}

uint64_t sub_100002E40(uint64_t a1)
{
  char *v2;
  char *v3;
  uint64_t v4;
  const char *v5;
  FILE *v6;
  const char *v7;
  size_t v8;
  char *v9;
  char *v10;
  char *v11;
  size_t v12;
  unint64_t v13;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  _copyfile_state *v23;
  _copyfile_state *v24;
  int v25;
  int *v26;
  FILE *v27;
  int *v28;
  const __CFString *v29;
  CFIndex Code;
  FILE *v31;
  int *v32;
  FILE *v33;
  int *v34;
  int *v35;
  int v36;
  CFErrorRef err;
  char *__endptr[32];
  char from[1024];

  bzero(from, 0x400uLL);
  v2 = *(char **)(a1 + 8);
  v3 = "/.b/8/";
  if (sub_100003528("/.b/8/", 0))
  {
    if (dword_10000C18C)
      fprintf(__stderrp, "Default mount %s is not available. Using backup %s.\n", "/.b/8/", "/private/system_data/");
    v3 = "/private/system_data/";
    if (sub_100003528("/private/system_data/", 0))
    {
      fwrite("Mountpoints not available. Exiting.\n", 0x24uLL, 1uLL, __stderrp);
      return 2;
    }
  }
  v5 = *(const char **)(a1 + 24);
  if (!v5)
  {
    v6 = __stderrp;
    v7 = "No mnt_opts provided to mount preflight.\n";
    v8 = 41;
LABEL_19:
    fwrite(v7, v8, 1uLL, v6);
LABEL_20:
    fwrite("Failed mount preflight. Exiting.\n", 0x21uLL, 1uLL, __stderrp);
    return 22;
  }
  if (sub_100003528("/sbin/mount_tmpfs", 1))
  {
    fprintf(__stderrp, "Failed to find executable: %s \n");
    goto LABEL_20;
  }
  v9 = strdup(v5);
  v10 = strtok(v9, ",");
  if (!v10)
  {
LABEL_18:
    free(v9);
    v6 = __stderrp;
    v7 = "Ramdisk fstab not in expected format.\n";
    v8 = 38;
    goto LABEL_19;
  }
  v11 = v10;
  while (1)
  {
    v12 = strlen(v11);
    if (v12 >= 6)
    {
      v13 = v12;
      if (!strncmp("size=", v11, 5uLL) || v13 >= 0xA && !strncmp("template=", v11, 9uLL))
        break;
    }
    v11 = strtok(0, ",");
    if (!v11)
      goto LABEL_18;
  }
  v15 = (char *)&v5[v11 - v9];
  *(v15 - 1) = 0;
  free(v9);
  v16 = sub_100003588(v15, "size=");
  if (!v16)
  {
    fprintf(__stderrp, "Unexpected mount size %zu\n");
    goto LABEL_20;
  }
  v17 = v16;
  __endptr[0] = 0;
  v18 = strtol(v16, __endptr, 0);
  if (__endptr[0] == v17 || *__endptr[0] || (v19 = v18, v18 <= 0))
  {
    fprintf(__stderrp, "Unexpected size string: %s\n", v17);
    free(v17);
    goto LABEL_20;
  }
  free(v17);
  v20 = sub_100003588(v15, "template=");
  if (v20)
  {
    v21 = v20;
    __strlcpy_chk(from, v20, 1024, 1024);
    free(v21);
  }
  v22 = v19 << 9;
  if (dword_10000C18C)
    fprintf(__stdoutp, "Mounting tmpfs volume at tmp location %s\n", v3);
  if ((int)sub_1000033D4(v3, v19 << 9) >= 1)
  {
    fprintf(__stderrp, "Initial mount to %s failed with %d\n");
    goto LABEL_53;
  }
  v23 = copyfile_state_alloc();
  copyfile_state_set(v23, 6u, sub_1000034AC);
  if (copyfile(from, v3, v23, 0x800Fu) < 0)
  {
    v31 = __stderrp;
    v32 = __error();
    strerror(*v32);
    fprintf(v31, "Failed to copy contents from %s to %s with error: %s\n");
    goto LABEL_53;
  }
  copyfile_state_free(v23);
  if (dword_10000C18C)
    fprintf(__stdoutp, "Mounting tmpfs volume at %s\n", v2);
  v4 = sub_1000033D4(v2, v22);
  if ((int)v4 >= 1)
  {
    fprintf(__stderrp, "Final mount to %s failed with %d\n");
    goto LABEL_53;
  }
  v24 = copyfile_state_alloc();
  copyfile_state_set(v24, 6u, sub_1000034AC);
  if (copyfile(v3, v2, v24, 0x800Fu) < 0)
  {
    v33 = __stderrp;
    v34 = __error();
    strerror(*v34);
    fprintf(v33, "Failed to copy contents from %s to %s with error: %s\n");
LABEL_53:
    v35 = __error();
    v36 = sub_100003F70(*v35, 0xFFFFFFFF);
    exit(v36);
  }
  copyfile_state_free(v24);
  LODWORD(err) = -1;
  __endptr[0] = "/sbin/umount";
  __endptr[1] = "-f";
  __endptr[2] = v3;
  __endptr[3] = 0;
  if ((sub_100003618(__endptr, &err) & 0x80000000) != 0)
  {
    fprintf(__stderrp, "Failed to execute command %s\n", __endptr[0]);
    v26 = __error();
    v25 = sub_100003F70(*v26, 0xFFFFFFFF);
  }
  else
  {
    v25 = (int)err;
  }
  if (v25)
  {
    v27 = __stderrp;
    v28 = __error();
    fprintf(v27, "Failed to unmount %s (errno %d).\n", v3, *v28);
  }
  if (sub_100003EF8())
  {
    err = 0;
    if ((UMLCreatePrimaryUserLayout(CFSTR("/"), CFSTR("/private/var/mobile"), 0, &err) & 1) != 0)
    {
      puts("UMLCreatePrimaryUserLayout passed without error");
    }
    else
    {
      v29 = CFErrorCopyDescription(err);
      Code = CFErrorGetCode(err);
      CFStringGetCString(v29, (char *)__endptr, 256, 0x8000100u);
      fprintf(__stderrp, "Failed to copy user template: %s (%ld).\n", (const char *)__endptr, Code);
      CFRelease(err);
      CFRelease(v29);
    }
  }
  if (dword_10000C18C)
    sub_1000055D4(0);
  return v4;
}

uint64_t sub_1000033D4(char *a1, uint64_t a2)
{
  int *v4;
  unsigned int v5;
  char *v6[5];
  char __str[64];

  v5 = -1;
  snprintf(__str, 0x40uLL, "%zu", a2);
  v6[0] = "/sbin/mount_tmpfs";
  v6[1] = "-s";
  v6[2] = __str;
  v6[3] = a1;
  v6[4] = 0;
  if ((sub_100003618(v6, &v5) & 0x80000000) == 0)
    return v5;
  fprintf(__stderrp, "Failed to execute command %s\n", v6[0]);
  v4 = __error();
  return sub_100003F70(*v4, 0xFFFFFFFF);
}

uint64_t sub_1000034AC(int a1, int a2)
{
  if (a2 == 1 && dword_10000C18C)
  {
    if (a1 == 2)
    {
      fprintf(__stderrp, "Creating %s/\n");
    }
    else if (a1 == 1)
    {
      fprintf(__stderrp, "Copying %s -> %s\n");
    }
  }
  return 0;
}

uint64_t sub_100003528(const char *a1, int a2)
{
  uint64_t result;
  FILE *v4;
  int *v5;
  char *v6;

  result = access(a1, a2);
  if ((_DWORD)result)
  {
    v4 = __stderrp;
    v5 = __error();
    v6 = strerror(*v5);
    fprintf(v4, "Failed access check for %s with issue %s\n", a1, v6);
    return *__error();
  }
  return result;
}

char *sub_100003588(char *a1, const char *a2)
{
  char *v3;
  size_t v4;
  size_t v5;
  const char *v6;
  size_t v7;
  size_t v8;
  char *v9;

  v3 = strstr(a1, a2);
  v4 = strlen(a2);
  if (!v3)
    return 0;
  v5 = v4;
  if (strlen(v3) <= v4)
    return 0;
  v6 = &v3[v5];
  v7 = strcspn(v6, ",");
  if (v7 - 1 > 0x3FE)
    return 0;
  v8 = v7;
  v9 = (char *)malloc_type_calloc(1uLL, v7 + 1, 0xA81E8FAEuLL);
  return strncpy(v9, v6, v8);
}

uint64_t sub_100003618(char **a1, _DWORD *a2)
{
  char **v2;
  FILE *v4;
  int *v5;
  FILE *v6;
  int v7;
  FILE *v8;
  int *v9;
  int v10;
  FILE *v11;
  int *v12;
  int v13;
  FILE *v14;
  int *v15;
  int v16;
  FILE *v17;
  int *v18;
  const char *v19;
  const char **v20;
  const char *v21;
  const char *v22;
  char ***v23;
  int v24;
  FILE *v25;
  int *v26;
  uint64_t v27;
  int v28;
  char **v30;
  FILE *v31;
  char *v32;
  char *v33;
  size_t v34;
  FILE *v35;
  int v36;
  int *v37;
  char *v38;
  FILE *v39;
  int *v40;
  FILE *v41;
  int *v42;
  FILE *v43;
  int *v44;
  FILE *v45;
  int *v46;
  int v47;
  size_t v48;
  posix_spawn_file_actions_t v49;
  pid_t v50;
  int v51;
  int v52[2];

  v2 = a1;
  v50 = 0;
  v51 = -1;
  v49 = 0;
  *(_QWORD *)v52 = -1;
  if (!a1)
  {
    fwrite("command_argv is NULL\n", 0x15uLL, 1uLL, __stderrp);
    v6 = 0;
    *__error() = 22;
LABEL_22:
    v27 = 0xFFFFFFFFLL;
    goto LABEL_23;
  }
  if (pipe(v52))
  {
    v4 = __stderrp;
    __error();
    v5 = __error();
    strerror(*v5);
    fprintf(v4, "Failed to create pipe for command output: %d (%s)\n");
LABEL_20:
    v2 = 0;
LABEL_21:
    v6 = 0;
    goto LABEL_22;
  }
  v7 = posix_spawn_file_actions_init(&v49);
  if (v7)
  {
    *__error() = v7;
    v8 = __stderrp;
    __error();
    v9 = __error();
    strerror(*v9);
    fprintf(v8, "posix_spawn_file_actions_init failed: %d (%s)\n");
    goto LABEL_20;
  }
  v10 = posix_spawn_file_actions_addclose(&v49, v52[0]);
  if (v10)
  {
    *__error() = v10;
    v11 = __stderrp;
    __error();
    v12 = __error();
    strerror(*v12);
    fprintf(v11, "posix_spawn_file_actions_addclose output_pipe[0] failed: %d (%s)\n");
    goto LABEL_20;
  }
  v13 = posix_spawn_file_actions_adddup2(&v49, v52[1], 1);
  if (v13)
  {
    *__error() = v13;
    v14 = __stderrp;
    __error();
    v15 = __error();
    strerror(*v15);
    fprintf(v14, "posix_spawn_file_actions_adddup2 output_pipe[1] failed: %d (%s)\n");
    goto LABEL_20;
  }
  v16 = posix_spawn_file_actions_addclose(&v49, v52[1]);
  if (v16)
  {
    *__error() = v16;
    v17 = __stderrp;
    __error();
    v18 = __error();
    strerror(*v18);
    fprintf(v17, "posix_spawn_file_actions_addclose output_pipe[1] failed: %d (%s)\n");
    goto LABEL_20;
  }
  if (dword_10000C18C)
  {
    fwrite("Executing command: ", 0x13uLL, 1uLL, __stdoutp);
    v19 = *v2;
    if (*v2)
    {
      v20 = (const char **)(v2 + 1);
      do
      {
        fprintf(__stdoutp, "%s ", v19);
        v21 = *v20++;
        v19 = v21;
      }
      while (v21);
    }
    fputc(10, __stdoutp);
  }
  v22 = *v2;
  v23 = _NSGetEnviron();
  v24 = posix_spawn(&v50, v22, &v49, 0, v2, *v23);
  if (v24)
  {
    *__error() = v24;
    v25 = __stderrp;
    __error();
    v26 = __error();
    strerror(*v26);
    fprintf(v25, "posix_spawn failed: %d (%s)\n");
    goto LABEL_20;
  }
  close(v52[1]);
  v52[1] = -1;
  v30 = (char **)malloc_type_calloc(0x400uLL, 1uLL, 0x100004077774924uLL);
  if (!v30)
  {
    v39 = __stderrp;
    __error();
    v40 = __error();
    strerror(*v40);
    fprintf(v39, "calloc failed: %d (%s)\n");
    goto LABEL_20;
  }
  v2 = v30;
  v31 = fdopen(v52[0], "r");
  if (!v31)
  {
    v41 = __stderrp;
    __error();
    v42 = __error();
    strerror(*v42);
    fprintf(v41, "fdopen failed: %d (%s)\n");
    goto LABEL_21;
  }
  v6 = v31;
  v48 = 0;
  v32 = fgetln(v31, &v48);
  if (v32)
  {
    v33 = v32;
    v34 = 0;
    do
    {
      if (v34 >= 1023 - v48)
        break;
      __strncat_chk(v2, v33);
      v34 += v48;
      v33 = fgetln(v6, &v48);
    }
    while (v33);
  }
  if (ferror(v6))
  {
    v35 = __stderrp;
    v36 = *__error();
    v37 = __error();
    v38 = strerror(*v37);
    fprintf(v35, "fgetln failed: %d (%s)\n", v36, v38);
    goto LABEL_22;
  }
  if (fclose(v6))
  {
    v43 = __stderrp;
    __error();
    v44 = __error();
    strerror(*v44);
    fprintf(v43, "fclose failed: %d (%s)\n");
    goto LABEL_21;
  }
  close(v52[0]);
  v52[0] = -1;
  while (waitpid(v50, &v51, 0) < 0)
  {
    if (*__error() != 4)
    {
      v45 = __stderrp;
      __error();
      v46 = __error();
      strerror(*v46);
      fprintf(v45, "waitpid failed: %d (%s)\n");
      goto LABEL_21;
    }
  }
  if (dword_10000C18C)
    fprintf(__stdoutp, "Command output:\n%s\n", (const char *)v2);
  if ((v51 & 0x7F) == 0x7F)
    goto LABEL_59;
  if ((v51 & 0x7F) != 0)
  {
    if (a2)
      *a2 = 0;
    fprintf(__stderrp, "Command signaled: %d\n");
    goto LABEL_63;
  }
  v47 = BYTE1(v51);
  if (a2)
    *a2 = BYTE1(v51);
  if (!v47)
  {
LABEL_59:
    v27 = 0;
    v6 = 0;
    goto LABEL_23;
  }
  fprintf(__stderrp, "Command failed: %d\n");
LABEL_63:
  v6 = 0;
  v27 = 1;
LABEL_23:
  v28 = *__error();
  if (v49)
    posix_spawn_file_actions_destroy(&v49);
  if (v6)
    fclose(v6);
  if ((v52[0] & 0x80000000) == 0)
    close(v52[0]);
  if ((v52[1] & 0x80000000) == 0)
    close(v52[1]);
  if (v2)
    free(v2);
  *__error() = v28;
  return v27;
}

int *sub_100003BF0(_DWORD *a1)
{
  int *v2;
  io_registry_entry_t v3;
  io_object_t v4;
  const __CFData *CFProperty;
  const __CFData *v6;
  int BootDevice;
  int v8;
  FILE *v9;
  const char *v10;
  char *v11;
  CFStringRef theString;
  CFRange v14;

  theString = 0;
  if (!(_BYTE)dword_10000C13C)
  {
    v3 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/filesystems/fstab");
    if (v3)
    {
      v4 = v3;
      CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v3, CFSTR("os_env_type"), kCFAllocatorDefault, 0);
      if (CFProperty)
      {
        v6 = CFProperty;
        v14.length = CFDataGetLength(CFProperty);
        v14.location = 0;
        CFDataGetBytes(v6, v14, (UInt8 *)&dword_10000C138);
        CFRelease(v6);
      }
      IOObjectRelease(v4);
      *a1 = dword_10000C138;
      BootDevice = APFSContainerGetBootDevice(&theString);
      if (!BootDevice)
      {
LABEL_14:
        v2 = &dword_10000C13C;
        strcpy((char *)&dword_10000C13C, "/dev/");
        CFStringGetCString(theString, (char *)&word_10000C140 + 1, 27, 0x8000100u);
        CFRelease(theString);
        return v2;
      }
      v8 = 5;
      while (1)
      {
        v9 = __stderrp;
        v10 = dword_10000C138 == 1 ? "" : "warning: ";
        v11 = strerror(BootDevice & 0x3FFF);
        fprintf(v9, "%sfailed to get boot device - %s\n", v10, v11);
        if (dword_10000C138 == 1)
          break;
        sleep(1u);
        if ((v8 + 1) < 2)
          break;
        fprintf(__stderrp, "Retrying (%d retries left)...\n", v8);
        BootDevice = APFSContainerGetBootDevice(&theString);
        --v8;
        if (!BootDevice)
          goto LABEL_14;
      }
    }
    else
    {
      fwrite("failed to get filesystem info\n", 0x1EuLL, 1uLL, __stderrp);
    }
    return 0;
  }
  *a1 = dword_10000C138;
  return &dword_10000C13C;
}

char *sub_100003DE0()
{
  char *v0;
  int v1;
  FILE *v2;
  const char *v3;
  char *v4;
  const __CFString *ValueAtIndex;
  int v7;
  CFArrayRef theArray;

  theArray = 0;
  v0 = &byte_10000C15C;
  if (!byte_10000C15C)
  {
    if ((_BYTE)dword_10000C13C || sub_100003BF0(&v7))
    {
      v1 = APFSVolumeRoleFind();
      if (v1)
      {
        v2 = __stderrp;
        if (dword_10000C138 == 1)
          v3 = "";
        else
          v3 = "warning: ";
        v4 = strerror(v1 & 0x3FFF);
        fprintf(v2, "%sfailed to lookup data volume - %s\n", v3, v4);
      }
      else
      {
        if (CFArrayGetCount(theArray) < 2)
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, 0);
          CFStringGetCString(ValueAtIndex, &byte_10000C15C, 32, 0x8000100u);
          CFRelease(theArray);
          return v0;
        }
        fwrite("found multiple data volumes\n", 0x1CuLL, 1uLL, __stderrp);
        CFRelease(theArray);
      }
    }
    return 0;
  }
  return v0;
}

BOOL sub_100003EF8()
{
  io_registry_entry_t v0;
  io_object_t v1;
  CFTypeRef CFProperty;
  _BOOL8 v3;

  v0 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/filesystems");
  if (!v0)
    return 0;
  v1 = v0;
  CFProperty = IORegistryEntryCreateCFProperty(v0, CFSTR("e-apfs"), kCFAllocatorDefault, 0);
  v3 = CFProperty != 0;
  if (CFProperty)
    CFRelease(CFProperty);
  IOObjectRelease(v1);
  return v3;
}

uint64_t sub_100003F70(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  v2 = a1;
  if (a2 == -1)
    a2 = sysexit_np(a1);
  if (dword_10000C188)
    return v2;
  else
    return a2;
}

void start(int a1, char *const *a2)
{
  const char **v4;
  uint64_t v5;
  unsigned int v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  BOOL v11;
  BOOL v12;
  int v13;
  int v14;
  const char **v15;
  int v16;
  const char *v17;
  const char *v18;
  const char *v19;
  size_t v20;
  int v21;
  const char *v22;
  int v23;
  uint64_t v24;
  char *v25;
  int *v26;
  int v27;
  int *v28;
  char *v29;
  char *v30;
  int v31;
  fstab *v32;
  int *v33;
  int v34;
  int v35;
  int *v36;
  int v37;
  int v38;
  uint64_t v39;
  int v40;
  char *f_mntonname;
  const char *f_fstypename;
  uint64_t f_mntfromname;
  statfs *v44;
  uint64_t v45;
  unsigned int v46;
  char *v47;
  const char *fs_mntops;
  int v49;
  int v50;
  fstab *v51;
  int v52;
  fstab *v53;
  const char *fs_type;
  int v55;
  const char *fs_vfstype;
  const char *fs_spec;
  int v58;
  const char *fs_file;
  uint64_t v60;
  int v61;
  const char *v62;
  const char *v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  char *v72;
  char v73;
  char *__s1;
  int v75;
  uint64_t v76;
  char v77[1024];
  char *__endptr;

  __endptr = 0;
  bzero(v77, 0x400uLL);
  v4 = 0;
  v72 = 0;
  v5 = 0;
  v6 = 0;
  __s1 = 0;
  v7 = 0;
  v73 = 0;
  while (1)
  {
    while (1)
    {
      v8 = v5;
      v9 = getopt(a1, a2, "headfFko:rwt:uvP:");
      if (v9 > 96)
      {
        v5 = 1;
        switch(v9)
        {
          case 'a':
            continue;
          case 'd':
            dword_10000C180 = 1;
            v5 = v8;
            continue;
          case 'e':
            dword_10000C188 = 1;
            v5 = v8;
            continue;
          case 'f':
            v6 |= 0x80000u;
            v5 = v8;
            continue;
          case 'k':
            v6 |= 0x8000000u;
            v5 = v8;
            continue;
          case 'o':
            v5 = v8;
            if (*optarg)
            {
              __s1 = sub_100004A08(__s1, optarg);
              if (strstr(optarg, "union"))
                v6 |= 0x20u;
              v5 = v8;
            }
            continue;
          case 'r':
            v6 |= 1u;
            v5 = v8;
            continue;
          case 't':
            if (v4)
            {
              if (dword_10000C188)
                v16 = 22;
              else
                v16 = 64;
              errx(v16, "only one -t option may be specified.");
            }
            v4 = (const char **)makevfslist(optarg);
            v72 = optarg;
            v5 = v8;
            continue;
          case 'u':
            v6 |= 0x10000u;
            v5 = v8;
            continue;
          case 'v':
            dword_10000C18C = 1;
            v5 = v8;
            continue;
          case 'w':
            v6 &= ~1u;
            v5 = v8;
            continue;
          default:
            goto LABEL_80;
        }
      }
      if (v9 != 70)
        break;
      v73 = 1;
      v5 = v8;
    }
    if (v9 != 80)
      break;
    v10 = strtol(optarg, &__endptr, 10);
    if (__endptr != optarg)
    {
      v7 = v10;
      v11 = *__endptr || v10 < 1;
      v12 = !v11 && v10 < 3;
      v5 = v8;
      if (v12)
        continue;
    }
    if (dword_10000C188)
      v13 = 22;
    else
      v13 = 64;
    errx(v13, "-P flag requires a valid mount phase number");
  }
  if (v9 != -1)
    goto LABEL_80;
  v14 = a1 - optind;
  v15 = (const char **)&a2[optind];
  if ((v7 - 1) >= 2)
  {
    v17 = v72;
    if (!v7)
      goto LABEL_43;
  }
  else
  {
    dword_10000C184 = v7;
  }
  LODWORD(v8) = 1;
  dword_10000C18C = 1;
  v17 = "nonfs";
  v4 = (const char **)makevfslist("nonfs");
LABEL_43:
  if (v14 != 2)
  {
    if (v14 != 1)
    {
      if (!v14)
      {
        if (!(_DWORD)v8)
        {
          if (!dword_10000C17C)
            sub_1000055D4(v4);
          exit(0);
        }
        v76 = 0;
        if (!setfsent())
        {
          if (*__error())
            v24 = *__error();
          else
            v24 = 6;
          v35 = sub_100003F70(v24, 0xFFFFFFFF);
          errx(v35, "mount: can't get filesystem checklist");
        }
        v75 = 0;
        v28 = sub_100003BF0(&v75);
        v29 = sub_100003DE0();
        if (v29)
        {
          fprintf(__stdoutp, "mount: found boot container: %s, data volume: %s env: %u\n", (const char *)v28, v29, v75);
          v30 = __s1;
        }
        else
        {
          v30 = __s1;
          if (v75 == 1 && dword_10000C184 == 2)
          {
            if (*__error())
              v39 = *__error();
            else
              v39 = 6;
            v67 = sub_100003F70(v39, 0xFFFFFFFF);
            errx(v67, "mount: missing data volume");
          }
          fprintf(__stdoutp, "mount: data volume missing, but not required in env: %u\n", v75);
        }
        v51 = getfsent();
        if (v51)
        {
          v53 = v51;
          v52 = 0;
          do
          {
            fs_type = v53->fs_type;
            v55 = strcmp(fs_type, "ro");
            if ((!v55 || !strcmp(fs_type, "rw") || !strcmp(fs_type, "rq"))
              && !checkvfsname(v53->fs_vfstype, v4)
              && !sub_100004B2C(v53->fs_mntops, "noauto"))
            {
              if ((fs_vfstype = v53->fs_vfstype, strcmp(fs_vfstype, "nfs")) && strcmp(fs_vfstype, "url")
                || !sub_100004B2C(v53->fs_mntops, "net")
                && v53->fs_spec
                && (fs_file = v53->fs_file) != 0
                && !sub_100004C10(v53->fs_spec, fs_file, 0))
              {
                if ((!dword_10000C184 || v53->fs_passno == dword_10000C184)
                  && (!sub_100004C10(v53->fs_spec, v53->fs_file, &v76) || v55 && (v76 & 1) != 0))
                {
                  fs_spec = v53->fs_spec;
                  if (!strcmp(v53->fs_spec, "ramdisk"))
                  {
                    if (dword_10000C18C)
                      fwrite("mount: encountered ramdisk\n", 0x1BuLL, 1uLL, __stdoutp);
                    v60 = sub_100002E40((uint64_t)v53);
                    if ((_DWORD)v60)
                    {
                      v71 = sub_100003F70(v60, 0xFFFFFFFF);
                      errx(v71, "mount: failed to setup tmpfs mount");
                    }
                    v52 = 0;
                  }
                  else
                  {
                    if (v53->fs_passno >= 2
                      && !strcmp(v53->fs_vfstype, "apfs")
                      && !strcmp(v53->fs_type, "rw")
                      && v29
                      && !dword_10000C180
                      && v75 == 1
                      && !strcmp(v29, fs_spec))
                    {
                      v61 = APFSContainerMigrateMediaKeys(v28);
                      if (v61)
                        fprintf(__stderrp, "mount: failed to migrate Media Keys, error = %x\n", v61);
                      else
                        fwrite("mount: successfully migrated Media Keys\n", 0x28uLL, 1uLL, __stdoutp);
                    }
                    v58 = sub_100004CB8(v53->fs_vfstype, (uint64_t)v53->fs_spec, v53->fs_file, v6, v30, v53->fs_mntops, v73 & 1);
                    if (v58)
                      v52 = v58;
                  }
                }
              }
            }
            v53 = getfsent();
          }
          while (v53);
        }
        else
        {
          v52 = 0;
        }
        endfsent();
        if (v7 == 2)
          sub_10000558C();
        exit(v52);
      }
      goto LABEL_80;
    }
    v22 = *v15;
    if (strlen(*v15) >= 0x401)
    {
      if (dword_10000C188)
        v23 = 22;
      else
        v23 = 65;
      errx(v23, "special file or file system %s too long.", v22);
    }
    if (!realpath_DARWIN_EXTSN(v22, v77))
    {
      v26 = __error();
      v27 = sub_100003F70(*v26, 0xFFFFFFFF);
      errx(v27, "%s: invalid special file or file system.", *v15);
    }
    if (!v4)
    {
      if ((v6 & 0x10000) != 0)
      {
        v50 = sub_10000565C(v77, v6, __s1);
        exit(v50);
      }
      v32 = getfsfile(v77);
      if (!v32)
      {
        v32 = getfsspec(v77);
        if (!v32)
        {
          v33 = __error();
          v34 = sub_100003F70(*v33, 0xFFFFFFFF);
          errx(v34, "%s: unknown special file or file system.", *v15);
        }
      }
      v62 = v32->fs_type;
      if (strcmp(v62, "ro") && strcmp(v62, "rw") && strcmp(v62, "rq"))
      {
        if (dword_10000C188)
          v69 = 22;
        else
          v69 = 65;
        errx(v69, "%s has unknown file system type.", *v15);
      }
      if (!strcmp(v32->fs_vfstype, "nfs"))
      {
        if (sub_100004B2C(v32->fs_mntops, "net"))
        {
          if (dword_10000C188)
            v68 = 22;
          else
            v68 = 65;
          errx(v68, "%s is owned by the automounter.", *v15);
        }
        if (sub_100004C10(v32->fs_spec, v32->fs_file, 0))
        {
          if (dword_10000C188)
            v70 = 37;
          else
            v70 = 78;
          errx(v70, "%s is already mounted at %s.", v32->fs_spec, v32->fs_file);
        }
      }
      v63 = v32->fs_spec;
      if (!strcmp(v32->fs_spec, "ramdisk"))
      {
        if (dword_10000C18C)
          fwrite("Found a ramdisk entry\n", 0x16uLL, 1uLL, __stdoutp);
        v64 = sub_100002E40((uint64_t)v32);
        exit(v64);
      }
      f_mntonname = v32->fs_file;
      f_fstypename = v32->fs_vfstype;
      fs_mntops = v32->fs_mntops;
      v40 = v73 & 1;
      f_mntfromname = (uint64_t)v63;
      v46 = v6;
      v47 = __s1;
LABEL_106:
      v49 = sub_100004CB8(f_fstypename, f_mntfromname, f_mntonname, v46, v47, fs_mntops, v40);
      exit(v49);
    }
LABEL_80:
    sub_100004AC4();
  }
  v18 = *v15;
  v19 = v15[1];
  v20 = strlen(v19);
  if (v20 >= 0x401)
  {
    if (dword_10000C188)
      v21 = 63;
    else
      v21 = 65;
    errx(v21, "file system %s too long.", v19);
  }
  if ((v6 & 0x8000000) != 0)
  {
    v25 = __s1;
    if ((unint64_t)__strlcpy_chk(v77, v19, 1024, 1024) >= 0x400)
    {
      if (dword_10000C188)
        v31 = 63;
      else
        v31 = 65;
      errx(v31, "file system %s too long.", v15[1]);
    }
  }
  else
  {
    v25 = __s1;
    if (v20)
    {
      if (!realpath_DARWIN_EXTSN(v19, v77))
      {
        v36 = __error();
        v37 = sub_100003F70(*v36, 0xFFFFFFFF);
        errx(v37, "%s: invalid file system.", v15[1]);
      }
    }
    else
    {
      v6 |= 0x8000000u;
      v73 = 1;
    }
  }
  if (!v4 && strchr((char *)*v15, 58))
  {
    if (sub_100004C10(v18, v77, 0))
    {
      if (dword_10000C188)
        v65 = 37;
      else
        v65 = 78;
      errx(v65, "%s is already mounted at %s.", v18, v77);
    }
    if ((v6 & 0x10000) == 0)
    {
      v17 = "nfs";
LABEL_100:
      v40 = v73 & 1;
      f_mntonname = v77;
      f_fstypename = v17;
      f_mntfromname = (uint64_t)v18;
LABEL_105:
      v46 = v6;
      v47 = v25;
      fs_mntops = 0;
      goto LABEL_106;
    }
  }
  else if ((v6 & 0x10000) == 0)
  {
    if (!v17)
    {
      if (dword_10000C188)
        v38 = 22;
      else
        v38 = 64;
      errx(v38, "You must specify a filesystem type with -t.");
    }
    goto LABEL_100;
  }
  v44 = sub_1000056E4(v77);
  if (!v44)
  {
    if (*__error())
      v45 = *__error();
    else
      v45 = 2;
    v66 = sub_100003F70(v45, 0xFFFFFFFF);
    errx(v66, "unknown special file or file system %s.", *v15);
  }
  f_mntfromname = (uint64_t)v44->f_mntfromname;
  f_mntonname = v44->f_mntonname;
  v40 = v73 & 1;
  f_fstypename = v44->f_fstypename;
  goto LABEL_105;
}

char *sub_100004A08(char *__s, char *__s1)
{
  size_t v4;
  size_t v5;
  char *v6;
  char *v7;

  if (!__s)
    return strdup(__s1);
  if (*__s)
  {
    v4 = strlen(__s);
    v5 = v4 + strlen(__s1) + 2;
    v6 = (char *)malloc_type_malloc(v5, 0xBC38757EuLL);
    if (!v6)
      sub_100005CBC();
    v7 = v6;
    snprintf(v6, v5, "%s,%s", __s, __s1);
  }
  else
  {
    v7 = strdup(__s1);
  }
  free(__s);
  return v7;
}

void sub_100004AC4()
{
  int v0;

  fprintf(__stderrp, "usage: mount %s %s\n       mount %s\n       mount %s\n", "[-dfFrkuvw] [-o options] [-t external_type]", "special mount_point", "[-adfFrkuvw] [-t external_type]", "[-dfrkuvw] special | mount_point");
  if (dword_10000C188)
    v0 = 22;
  else
    v0 = 64;
  exit(v0);
}

uint64_t sub_100004B2C(const char *a1, const char *a2)
{
  const char *v2;
  int v3;
  _BOOL4 v4;
  char *v5;
  char *v6;
  uint64_t i;
  BOOL v8;
  unsigned int v9;

  v2 = a2;
  if (*a2 == 110)
  {
    if (a2[1] == 111)
    {
      v2 = a2 + 2;
      v3 = 0;
    }
    else
    {
      v3 = 1;
    }
    v4 = *((unsigned __int8 *)a2 + 1) == 111;
  }
  else
  {
    v4 = 0;
    v3 = 1;
  }
  v5 = strdup(a1);
  v6 = strtok(v5, ",");
  for (i = 0; v6; v6 = strtok(0, ","))
  {
    if (*v6 == 110)
    {
      v8 = v6[1] == 111;
      v6 += 2 * v8;
      if (v8)
        v9 = v4;
      else
        v9 = v3;
    }
    else
    {
      v9 = v3;
    }
    if (!strcasecmp(v6, v2))
      i = v9;
    else
      i = i;
  }
  free(v5);
  return i;
}

uint64_t sub_100004C10(const char *a1, const char *a2, _QWORD *a3)
{
  int v6;
  statfs *v7;
  uint64_t v8;
  statfs *v10;

  v10 = 0;
  v6 = getmntinfo(&v10, 2);
  if (!v6)
    sub_100005CEC();
  if (v6 < 1)
    return 0;
  v7 = v10;
  v8 = v6;
  while (strcmp(v7->f_mntfromname, a1) || strcmp(v7->f_mntonname, a2))
  {
    ++v7;
    if (!--v8)
      return 0;
  }
  if (a3)
    *a3 = v7->f_flags;
  return 1;
}

uint64_t sub_100004CB8(const char *a1, uint64_t a2, const char *a3, unsigned int a4, char *a5, const char *a6, int a7)
{
  size_t v13;
  size_t v14;
  const char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  const char *v20;
  char **v21;
  int v22;
  const char *v23;
  const char *v24;
  char **v25;
  const char *v26;
  uint64_t result;
  int v28;
  int v29;
  uint64_t v30;
  int v31;
  int v32;
  uint64_t v33;
  const char **v34;
  uint64_t v35;
  const char *v36;
  pid_t v37;
  pid_t v38;
  uint64_t v39;
  BOOL v40;
  unsigned int v41;
  unsigned int v42;
  const char *v43;
  char **v44;
  const char *v45;
  char v46;
  const char *v47;
  char **v48;
  int v49;
  int v50;
  const char *v51;
  unsigned int v52;
  int *v53;
  int v54;
  char *v55;
  stat v56;
  int v57;
  int v58;
  char __s[2];
  char __str[1025];
  statfs v61;
  _OWORD v62[50];

  memset(v62, 0, 512);
  memset(&v61, 0, 512);
  v57 = 0;
  if ((a4 & 0x8000000) != 0)
  {
    if ((unint64_t)__strlcpy_chk(__s, a3, 1024, 1024) >= 0x400)
      return 22;
  }
  else if (!realpath_DARWIN_EXTSN(a3, __s))
  {
    if (dword_10000C184 != 2
      || ((v13 = strlen(__s), v13 >= 0xC) ? (v14 = 12) : (v14 = v13), strncmp(__s, "/private/var", v14)))
    {
      warn("realpath %s");
      goto LABEL_88;
    }
    if (mkdir(__s, 0x1C0u))
    {
      warn("mkdir %s");
      goto LABEL_88;
    }
  }
  if (a6)
    v15 = a6;
  else
    v15 = "";
  if (!a5)
  {
    a5 = *v15 ? (char *)v15 : "";
    if (*v15)
      v15 = "";
  }
  v16 = strdup(v15);
  v17 = sub_100004A08(v16, a5);
  v18 = v17;
  if (((bswap32(*(unsigned __int16 *)__s) >> 16) - 12032) | a4 & 0x20)
    v19 = a4;
  else
    v19 = a4 | 0x10000;
  if ((v19 & 0x80000) != 0)
    v18 = sub_100004A08(v17, "force");
  if ((v19 & 1) != 0)
    v18 = sub_100004A08(v18, "ro");
  v58 = 0;
  if ((v19 & 0x10000) != 0)
  {
    v18 = sub_100004A08(v18, "update");
    if ((v19 & 0x100000) == 0)
    {
LABEL_29:
      if ((v19 & 0x80) == 0)
        goto LABEL_31;
      goto LABEL_30;
    }
  }
  else if ((v19 & 0x100000) == 0)
  {
    goto LABEL_29;
  }
  v18 = sub_100004A08(v18, "nobrowse");
  if ((v19 & 0x80) != 0)
LABEL_30:
    v18 = sub_100004A08(v18, "protect");
LABEL_31:
  v55 = strndup(v18, 0x400uLL);
  if ((v19 & 0x8000000) != 0)
    v18 = sub_100004A08(v18, "nofollow");
  v20 = "/sbin";
  v21 = &off_1000085B8;
  memset(&v56, 0, sizeof(v56));
  do
  {
    snprintf(__str, 0x401uLL, "%s/mount_%s", v20, a1);
    v22 = stat(__str, &v56);
    if (!v22)
    {
LABEL_39:
      if (v22 || (a7 & 1) != 0)
        goto LABEL_47;
      goto LABEL_50;
    }
    v23 = *v21++;
    v20 = v23;
  }
  while (v23);
  v24 = "/System/Library/Filesystems";
  v25 = &off_1000085D0;
  while (1)
  {
    snprintf(__str, 0x401uLL, "%s/%s.fs/%s/mount_%s", v24, a1, "Contents/Resources", a1);
    if (!stat(__str, &v56))
      break;
    v26 = *v25++;
    v24 = v26;
    if (!v26)
      goto LABEL_39;
  }
  if (a7)
  {
LABEL_47:
    v58 = 1;
    *(_QWORD *)&v62[0] = a1;
    sub_1000058F8(v55, &v58, (uint64_t)v62, 97);
    v28 = v58;
    v29 = v58 + 1;
    *((_QWORD *)v62 + v58) = a2;
    v30 = (v28 + 2);
    *((_QWORD *)v62 + v29) = __s;
    *((_QWORD *)v62 + (int)v30) = 0;
    result = sub_100001B94(1, v19, v30, v62);
    if (!(_DWORD)result || !a7)
    {
      if (!(_DWORD)result)
        return result;
      goto LABEL_50;
    }
    switch((_DWORD)result)
    {
      case 0x2D:
        warnx("FSKit unavailable");
        v40 = dword_10000C188 == 0;
        v41 = 45;
        break;
      case 8:
        warnx("File system named %s unable to mount", a1);
        v40 = dword_10000C188 == 0;
        v41 = 8;
        break;
      case 2:
        warnx("File system named %s not found", a1);
        v40 = dword_10000C188 == 0;
        v41 = 2;
        break;
      default:
        warnx("Unable to invoke task");
        v40 = dword_10000C188 == 0;
        v41 = 22;
        break;
    }
LABEL_95:
    v42 = 69;
    goto LABEL_96;
  }
LABEL_50:
  v58 = 1;
  *(_QWORD *)&v62[0] = a1;
  sub_1000058F8(v18, &v58, (uint64_t)v62, 97);
  v31 = v58;
  v32 = v58 + 1;
  *((_QWORD *)v62 + v58) = a2;
  v33 = (v31 + 2);
  v58 = v31 + 2;
  *((_QWORD *)v62 + v32) = __s;
  *((_QWORD *)v62 + (int)v33) = 0;
  if (dword_10000C180)
  {
    printf("exec: mount_%s", a1);
    if ((v31 & 0x80000000) == 0)
    {
      v34 = (const char **)v62 + 1;
      v35 = v33 - 1;
      do
      {
        v36 = *v34++;
        printf(" %s", v36);
        --v35;
      }
      while (v35);
    }
    putchar(10);
    return 0;
  }
  v37 = fork();
  if (v37 == -1)
  {
    warn("fork");
    free(v18);
    v41 = *__error();
    v40 = dword_10000C188 == 0;
    v42 = 71;
    goto LABEL_96;
  }
  v38 = v37;
  if (v37)
  {
    free(v18);
    free(v55);
    if (waitpid(v38, &v57, 0) < 0)
    {
      sub_100005D08(&v56);
      return v56.st_dev;
    }
    v39 = v57 & 0x7F;
    if ((_DWORD)v39 != 127)
    {
      if ((v57 & 0x7F) != 0)
      {
        warnx("%s: %s", __s, sys_siglist[v39]);
        v40 = dword_10000C188 == 0;
        v41 = 4;
        goto LABEL_95;
      }
      if (BYTE1(v57))
      {
        warnx("%s failed with %d", __s, BYTE1(v57));
        if (dword_10000C188)
          return 4;
        else
          return BYTE1(v57);
      }
    }
    if (!dword_10000C18C)
      return 0;
    if ((statfs(__s, &v61) & 0x80000000) == 0)
    {
      sub_100005764((uint64_t)&v61);
      return 0;
    }
    warn("statfs %s");
LABEL_88:
    v52 = *__error();
    LODWORD(result) = sysexit_np(v52);
    if (dword_10000C188)
      return v52;
    else
      return result;
  }
  v43 = "/sbin";
  v44 = &off_1000085B8;
  do
  {
    snprintf(__str, 0x401uLL, "%s/mount_%s", v43, a1);
    *(_QWORD *)&v62[0] = __str;
    execv(__str, (char *const *)v62);
    if (*__error() != 2)
      warn("exec %s for %s", __str, __s);
    v45 = *v44++;
    v43 = v45;
  }
  while (v45);
  v46 = 0;
  v47 = "/System/Library/Filesystems";
  v48 = &off_1000085D0;
  do
  {
    snprintf(__str, 0x401uLL, "%s/%s.fs/%s/mount_%s", v47, a1, "Contents/Resources", a1);
    *(_QWORD *)&v62[0] = __str;
    execv(__str, (char *const *)v62);
    if (*__error() == 2)
    {
      if ((v46 & 1) != 0)
        goto LABEL_80;
LABEL_79:
      v58 = 1;
      *(_QWORD *)&v62[0] = a1;
      sub_1000058F8(v55, &v58, (uint64_t)v62, 97);
      v49 = v58;
      v50 = v58 + 1;
      *((_QWORD *)v62 + v58) = a2;
      v49 += 2;
      v58 = v49;
      *((_QWORD *)v62 + v50) = __s;
      *((_QWORD *)v62 + v49) = 0;
      goto LABEL_80;
    }
    warn("exec %s for %s", __str, __s);
    if ((v46 & 1) == 0)
      goto LABEL_79;
LABEL_80:
    v51 = *v48++;
    v47 = v51;
    v46 = 1;
  }
  while (v51);
  if (*__error() != 2)
  {
    v53 = __error();
    v54 = sub_100003F70(*v53, 0xFFFFFFFF);
    exit(v54);
  }
  warn("exec %s for %s", __str, __s);
  v41 = *__error();
  v40 = dword_10000C188 == 0;
  v42 = 72;
LABEL_96:
  if (v40)
    return v42;
  else
    return v41;
}

void sub_10000558C()
{
  int *v0;
  int v1;
  char *__argv[3];

  __argv[0] = "/System/Library/Filesystems/apfs.fs/apfs_boot_util";
  __argv[1] = "2";
  __argv[2] = 0;
  execv("/System/Library/Filesystems/apfs.fs/apfs_boot_util", __argv);
  v0 = __error();
  v1 = sub_100003F70(*v0, 0xFFFFFFFF);
  errx(v1, "apfs_boot_util exec failed");
}

uint64_t sub_1000055D4(const char **a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;
  statfs *v5;

  v5 = 0;
  result = getmntinfo(&v5, 2);
  if (!(_DWORD)result)
    sub_100005CEC();
  if ((int)result >= 1)
  {
    v3 = 0;
    v4 = 2168 * result;
    do
    {
      result = checkvfsname(v5[v3 / 0x878].f_fstypename, a1);
      if (!(_DWORD)result)
        result = sub_100005764((uint64_t)&v5[v3 / 0x878]);
      v3 += 2168;
    }
    while (v4 != v3);
  }
  return result;
}

uint64_t sub_10000565C(const char *a1, int a2, char *a3)
{
  statfs *v6;
  statfs *v7;
  uint64_t f_mntfromname;
  fstab *v9;

  v6 = sub_1000056E4(a1);
  if (!v6)
    sub_100005D54(a1);
  v7 = v6;
  f_mntfromname = (uint64_t)v6->f_mntfromname;
  if (!strchr(v6->f_mntfromname, 47))
  {
    v9 = getfsfile(v7->f_mntonname);
    if (v9)
      f_mntfromname = (uint64_t)v9->fs_spec;
  }
  return sub_100004CB8(v7->f_fstypename, f_mntfromname, v7->f_mntonname, v7->f_flags & 0x80 | a2, a3, 0, 0);
}

statfs *sub_1000056E4(const char *a1)
{
  int v2;
  statfs *v3;
  uint64_t v4;
  statfs *v6;

  v6 = 0;
  v2 = getmntinfo(&v6, 2);
  if (v2 < 1)
    return 0;
  v3 = v6;
  v4 = v2;
  while (strcmp(v3->f_mntfromname, a1) && strcmp(v3->f_mntonname, a1))
  {
    ++v3;
    if (!--v4)
      return 0;
  }
  return v3;
}

uint64_t sub_100005764(uint64_t a1)
{
  const char *v2;
  unsigned int v3;
  int *v4;
  int v5;
  int *v6;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  int v12;

  v2 = (const char *)(a1 + 88);
  printf("%s on %s (%s", (const char *)(a1 + 1112), (const char *)(a1 + 88), (const char *)(a1 + 72));
  v12 = 0;
  v10 = 0u;
  v11 = 0u;
  v8 = xmmword_10000684C;
  v9 = 0;
  if (!getattrlist(v2, &v8, &v10, 0x24uLL, 0) && (BYTE7(v11) & 2) != 0 && (DWORD1(v10) & 0x2000000) != 0)
    printf(", sealed");
  v3 = *(_DWORD *)(a1 + 64) & 0xDFF0F7FF;
  if (v3)
  {
    v4 = &dword_1000085E0;
    do
    {
      if (!*v4)
        break;
      if ((*v4 & v3) != 0)
      {
        printf(", %s", *((const char **)v4 + 1));
        v3 &= ~*v4;
      }
      v4 += 6;
    }
    while (v3);
  }
  v5 = *(_DWORD *)(a1 + 2136);
  if (v5)
  {
    v6 = &dword_1000087C0;
    do
    {
      if (!*v6)
        break;
      if ((*v6 & v5) != 0)
      {
        printf(", %s", *((const char **)v6 + 1));
        v5 &= ~*v6;
      }
      v6 += 6;
    }
    while (v5);
  }
  if (*(_DWORD *)(a1 + 56))
  {
    printf(", mounted by ");
    if (getpwuid(*(_DWORD *)(a1 + 56)))
      printf("%s");
    else
      printf("%d");
  }
  return puts(")");
}

char *sub_1000058F8(char *a1, int *a2, uint64_t a3, int a4)
{
  int v7;
  char *result;
  int v9;
  char *v10;
  char *__stringp;

  v7 = *a2;
  __stringp = a1;
  while (1)
  {
    result = strsep(&__stringp, ",");
    if (!result)
      break;
    if (*result)
    {
      if (*result != 45)
      {
        v9 = v7 + 1;
        *(_QWORD *)(a3 + 8 * v7) = "-o";
        goto LABEL_10;
      }
      if (result[1] != 45 || result[2])
      {
        v9 = v7 + 1;
        *(_QWORD *)(a3 + 8 * v7) = result;
        v10 = strchr(result, 61);
        if (v10)
        {
          *v10 = 0;
          result = v10 + 1;
LABEL_10:
          *(_QWORD *)(a3 + 8 * v9) = result;
          v9 = v7 + 2;
        }
        v7 = v9;
        if (v9 >= a4)
          sub_100005D80();
      }
    }
  }
  *a2 = v7;
  return result;
}

uint64_t sub_1000059C8(unsigned int *a1)
{
  return sub_100003F70(*a1, 0xFFFFFFFF);
}

uint64_t checkvfsname(char *__s1, const char **a2)
{
  const char **v2;
  const char *v3;
  const char **v5;
  const char *v6;

  v2 = a2;
  if (a2)
  {
    v3 = *a2;
    if (*v2)
    {
      v5 = v2 + 1;
      while (strcmp(__s1, v3))
      {
        v6 = *v5++;
        v3 = v6;
        if (!v6)
          goto LABEL_6;
      }
      LOBYTE(v2) = byte_10000C190;
    }
    else
    {
LABEL_6:
      LOBYTE(v2) = byte_10000C190 ^ 1;
    }
  }
  return v2 & 1;
}

_QWORD *makevfslist(char *a1)
{
  char *v1;
  int v2;
  char *i;
  _QWORD *v4;
  _QWORD *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  if (!a1)
    return 0;
  v1 = a1;
  if (*a1 == 110 && a1[1] == 111)
  {
    v1 = a1 + 2;
    byte_10000C190 = 1;
  }
  v2 = 0;
  for (i = v1; *i == 44; ++i)
  {
    ++v2;
LABEL_10:
    ;
  }
  if (*i)
    goto LABEL_10;
  v4 = malloc_type_malloc(8 * (v2 + 2), 0x10040436913F5uLL);
  v5 = v4;
  if (v4)
  {
    *v4 = v1;
    v6 = strchr(v1, 44);
    v7 = 1;
    if (v6)
    {
      do
      {
        *v6 = 0;
        v8 = v6 + 1;
        v9 = v7 + 1;
        v5[v7] = v8;
        v6 = strchr(v8, 44);
        v7 = v9;
      }
      while (v6);
      v7 = v9;
    }
    v5[v7] = 0;
  }
  else
  {
    warn(0);
  }
  return v5;
}

void sub_100005B18(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  const char *v5;
  id v6;
  const char *v7;
  id v8;

  sub_100002E08(*(_QWORD *)(a1 + 32));
  v4 = v3;
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "description")));
  v5 = (const char *)objc_msgSend(v8, "UTF8String");
  v6 = objc_retainAutorelease(v4);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  warnx("Error %s parsing '%s'", v5, v7);
}

void sub_100005B9C()
{
  void *v0;
  id v1;
  id v2;
  const char *v3;
  const char *v4;
  id *v5;
  id v6;

  sub_100002E34();
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "localizedDescription")));
  v4 = (const char *)sub_100002E18(v2, v3);
  warnx("Operation ended with error: %s", v4);

  v5 = (id *)sub_100002E20();
  sub_100002DE4(v5, v6);
}

void sub_100005BE4()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  const char *v4;
  const char *v5;

  sub_100002E34();
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedDescription")));
  v5 = (const char *)sub_100002E18(v3, v4);
  warnx("Operation ended with error: %s", v5);

  sub_100002DF4();
  dispatch_group_leave(*(dispatch_group_t *)(v0 + 32));
  sub_100002E08(*(_QWORD *)(v0 + 48));
}

void sub_100005C48()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  const char *v4;
  const char *v5;

  sub_100002E34();
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedDescription")));
  v5 = (const char *)sub_100002E18(v3, v4);
  warnx("%s:%d: Operation ended with error: %s", "invoke_tool_from_fskit_block_invoke_9", 309, v5);

  sub_100002DF4();
  dispatch_group_leave(*(dispatch_group_t *)(v0 + 32));
  sub_100002E08(*(_QWORD *)(v0 + 48));
}

void sub_100005CBC()
{
  int v0;
  int v1;

  v0 = *__error();
  if (dword_10000C188)
    v1 = v0;
  else
    v1 = 75;
  err(v1, "failed to allocate memory for arguments");
}

void sub_100005CEC()
{
  int *v0;
  int v1;

  v0 = __error();
  v1 = sub_1000059C8((unsigned int *)v0);
  err(v1, "getmntinfo");
}

uint64_t sub_100005D08(_DWORD *a1)
{
  unsigned int v2;
  uint64_t result;
  int v4;

  warn("waitpid");
  v2 = *__error();
  result = sysexit_np(v2);
  if (dword_10000C188)
    v4 = v2;
  else
    v4 = result;
  *a1 = v4;
  return result;
}

void sub_100005D54(const char *a1)
{
  int *v2;
  int v3;

  v2 = __error();
  v3 = sub_1000059C8((unsigned int *)v2);
  errx(v3, "unknown special file or file system %s.", a1);
}

void sub_100005D80()
{
  int v0;

  if (dword_10000C188)
    v0 = 7;
  else
    v0 = 64;
  errc(v0, 7, "too many mount arguments");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_activateVolume_shortName_options_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateVolume:shortName:options:replyHandler:");
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributes");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleForArguments_count_syntaxDictionary_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForArguments:count:syntaxDictionary:errorHandler:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_checkResource_usingBundle_options_connection_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkResource:usingBundle:options:connection:replyHandler:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_containerID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerID");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_deactivateVolume_shortName_options_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deactivateVolume:shortName:options:replyHandler:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_enumerateOptionsWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateOptionsWithBlock:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_formatResource_usingBundle_options_connection_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formatResource:usingBundle:options:connection:replyHandler:");
}

id objc_msgSend_fs_containerIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fs_containerIdentifier");
}

id objc_msgSend_getConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getConnection");
}

id objc_msgSend_installedExtensionWithShortName_synchronous_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installedExtensionWithShortName:synchronous:replyHandler:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_loadResource_shortName_options_synchronousReplyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadResource:shortName:options:synchronousReplyHandler:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_mountVolume_fileSystem_displayName_provider_domainError_on_how_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mountVolume:fileSystem:displayName:provider:domainError:on:how:options:");
}

id objc_msgSend_newClientForProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newClientForProvider:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_probeResourceSync_usingBundle_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "probeResourceSync:usingBundle:replyHandler:");
}

id objc_msgSend_proxyResourceForBSDName_writable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxyResourceForBSDName:writable:");
}

id objc_msgSend_receiverForStandardIO_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiverForStandardIO:");
}

id objc_msgSend_resetOptionEnumeration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetOptionEnumeration");
}

id objc_msgSend_resourceWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resourceWithURL:");
}

id objc_msgSend_secureResourceWithURL_readonly_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secureResourceWithURL:readonly:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uuid");
}

id objc_msgSend_volumeID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volumeID");
}

id objc_msgSend_volumeName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volumeName");
}
