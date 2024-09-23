void sub_100002CB0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  id v10;
  FILE *v11;
  id v12;

  v9 = a1;
  v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v9, &a9);

  v11 = __stdoutp;
  v12 = objc_retainAutorelease(v10);
  fputs((const char *)objc_msgSend(v12, "cStringUsingEncoding:", 4), v11);

}

void sub_100002D30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  id WeakRetained;

  sub_100002CB0(CFSTR("XPC connection interrupted\n"), a2, a3, a4, a5, a6, a7, a8, v9);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stop");

}

void sub_100002D74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  id WeakRetained;

  sub_100002CB0(CFSTR("XPC connection invalidated\n"), a2, a3, a4, a5, a6, a7, a8, v9);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stop");

}

void sub_100002E54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id WeakRetained;

  sub_100002CB0(CFSTR("XPC error: %@\n"), a2, a3, a4, a5, a6, a7, a8, a2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stop");

}

int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  ClientSideWrapper *v4;
  void *v5;
  ClientSideWrapper *v6;
  _QWORD v8[4];
  _UNKNOWN **v9;
  ClientSideWrapper *v10;

  v3 = objc_autoreleasePoolPush();
  v4 = objc_opt_new(ClientSideWrapper);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ClientSideWrapper proxy](v4, "proxy"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000030BC;
  v8[3] = &unk_100004190;
  v9 = &off_1000044E8;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "retrieveMoreDebugInformationWithCompletion:", v8);

  CFRunLoopRun();
  objc_autoreleasePoolPop(v3);
  return 0;
}

void sub_1000030BC(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  uint64_t v39;
  void *i;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];

  v3 = a2;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
  if (v4)
  {
    v5 = v4;
    v61 = *(_QWORD *)v67;
    v59 = v3;
    do
    {
      v6 = 0;
      v60 = v5;
      do
      {
        if (*(_QWORD *)v67 != v61)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Message")));

        if (v8)
        {
          v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Timestamp")));
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Type")));
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Message")));
          sub_100002CB0(CFSTR("%@: %@: %@\n"), v10, v11, v12, v13, v14, v15, v16, (uint64_t)v9);

        }
        else
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Description")));

          if (v17)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Description")));
            sub_100002CB0(CFSTR("\t%@:\n"), v19, v20, v21, v22, v23, v24, v25, (uint64_t)v18);

            v26 = CFSTR("Active");
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Active")));
            if (!objc_msgSend(v27, "BOOLValue"))
              v26 = CFSTR("Inactive");
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("KeyboardFocus")));
            objc_msgSend(v28, "BOOLValue");
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CommandFocus")));
            objc_msgSend(v29, "BOOLValue");
            sub_100002CB0(CFSTR("\t -> State: %@ %@ %@\n"), v30, v31, v32, v33, v34, v35, v36, (uint64_t)v26);

            v64 = 0u;
            v65 = 0u;
            v62 = 0u;
            v63 = 0u;
            v9 = v7;
            v37 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
            if (v37)
            {
              v38 = v37;
              v39 = *(_QWORD *)v63;
              v5 = v60;
              do
              {
                for (i = 0; i != v38; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v63 != v39)
                    objc_enumerationMutation(v9);
                  v41 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
                  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v41) & 1) == 0)
                  {
                    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v41));
                    sub_100002CB0(CFSTR("\t\t %@: %@\n"), v42, v43, v44, v45, v46, v47, v48, v41);

                  }
                }
                v38 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
              }
              while (v38);
              v3 = v59;
            }
            else
            {
              v3 = v59;
              v5 = v60;
            }
          }
          else
          {
            v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Timestamp")));
            sub_100002CB0(CFSTR("%@:\n"), v49, v50, v51, v52, v53, v54, v55, (uint64_t)v9);
          }
        }

        v6 = (char *)v6 + 1;
      }
      while (v6 != v5);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
    }
    while (v5);
  }
  objc_msgSend(*(id *)(a1 + 40), "stop");

}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createArbiterConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createArbiterConnection");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_proxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxy");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_retrieveMoreDebugInformationWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrieveMoreDebugInformationWithCompletion:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stop");
}
