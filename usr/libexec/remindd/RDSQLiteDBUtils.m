@implementation RDSQLiteDBUtils

+ (BOOL)copySQLiteFileAtPath:(id)a3 toPath:(id)a4 timeout:(double)a5 error:(id *)a6
{
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  const char *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  NSString *(__cdecl **v22)(SEL);
  uint64_t v23;
  void *v24;
  BOOL v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  NSString *v29;
  void *v30;
  void *v31;
  NSString *v32;
  objc_class *v33;
  NSString *v34;
  NSString *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  objc_class *v39;
  NSString *v40;
  const char *v41;
  void *v42;
  NSString *v43;
  void *v44;
  void *v45;
  void *v46;
  unsigned __int8 v47;
  NSString *(__cdecl **v48)(SEL);
  double v49;
  double v50;
  uint64_t v51;
  double v52;
  NSObject *v53;
  uint64_t v54;
  objc_class *v55;
  NSString *v56;
  void *v57;
  NSString *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  NSObject *v62;
  uint64_t v63;
  objc_class *v64;
  NSString *v65;
  void *v66;
  NSString *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  const __CFString *v76;
  uint64_t v77;
  NSObject *v78;
  uint64_t v79;
  objc_class *v80;
  NSString *v81;
  void *v82;
  NSString *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  id v89;
  NSObject *v90;
  uint64_t v91;
  objc_class *v92;
  NSString *v93;
  void *v94;
  NSString *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  int v101;
  NSObject *v102;
  NSObject *v103;
  uint64_t v104;
  objc_class *v105;
  NSString *v106;
  const char *v107;
  void *v108;
  NSString *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  objc_class *v113;
  NSString *v114;
  void *v115;
  NSString *v116;
  const char *v117;
  void *v118;
  void *v119;
  int v120;
  NSObject *v121;
  NSObject *v122;
  uint64_t v123;
  objc_class *v124;
  NSString *v125;
  uint64_t v126;
  const char *v127;
  void *v128;
  NSString *v129;
  void *v130;
  void *v131;
  uint64_t v132;
  objc_class *v133;
  NSString *v134;
  void *v135;
  NSString *v136;
  void *v137;
  void *v138;
  id v139;
  id v140;
  uint64_t v141;
  void *i;
  void *v143;
  NSObject *v145;
  uint64_t v146;
  objc_class *v147;
  NSString *v148;
  void *v149;
  NSString *v150;
  void *v151;
  void *v152;
  double v153;
  double v154;
  NSObject *v155;
  uint64_t v156;
  objc_class *v157;
  NSString *v158;
  void *v159;
  NSString *v160;
  void *v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  const char *aSelector;
  void *v167;
  id v168;
  id v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  sqlite3 *db;
  sqlite3 *ppDb;
  uint8_t v176[128];
  uint8_t buf[4];
  void *v178;
  __int16 v179;
  id v180;
  __int16 v181;
  double v182;

  v11 = a3;
  v12 = a4;
  v14 = v12;
  if (!v11)
  {
    if (a6)
    {
      v26 = (objc_class *)objc_opt_class(a1, v13);
      v27 = NSStringFromClass(v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v29 = NSStringFromSelector(a2);
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v28, v30));
      v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%@] fromPath is nil"), v31);
LABEL_12:
      v36 = (void *)objc_claimAutoreleasedReturnValue(v32);
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[REMError internalErrorWithDebugDescription:](REMError, "internalErrorWithDebugDescription:", v36));

    }
LABEL_13:
    v25 = 0;
    goto LABEL_82;
  }
  if (!v12)
  {
    if (a6)
    {
      v33 = (objc_class *)objc_opt_class(a1, v13);
      v34 = NSStringFromClass(v33);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v34);
      v35 = NSStringFromSelector(a2);
      v30 = (void *)objc_claimAutoreleasedReturnValue(v35);
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v28, v30));
      v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%@] toPath is nil"), v31);
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v168 = a1;
  v15 = v11;
  v16 = v14;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v169 = objc_retainAutorelease(v15);
  v18 = (const char *)objc_msgSend(v169, "fileSystemRepresentation");
  v19 = objc_retainAutorelease(v16);
  v20 = (const char *)objc_msgSend(v19, "fileSystemRepresentation");
  db = 0;
  ppDb = 0;
  v21 = sqlite3_open_v2(v18, &ppDb, 1, 0);
  v22 = &NSStringFromSelector_ptr;
  v167 = v14;
  if ((_DWORD)v21)
  {
    if (a6)
    {
      v23 = v21;
      v24 = ppDb;
      if (ppDb)
        v24 = (void *)sqlite3_errmsg(ppDb);
      v25 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[REMError sqliteErrorWithCode:path:format:](REMError, "sqliteErrorWithCode:path:format:", -101, v169, CFSTR("Error opening SQLite file: %s (%d)"), v24, v23));
      goto LABEL_59;
    }
LABEL_23:
    v25 = 0;
    goto LABEL_59;
  }
  v37 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    v39 = (objc_class *)objc_opt_class(v168, v38);
    v40 = NSStringFromClass(v39);
    v41 = a2;
    v42 = (void *)objc_claimAutoreleasedReturnValue(v40);
    v43 = NSStringFromSelector(v41);
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v42, v44));
    *(_DWORD *)buf = 138543618;
    v178 = v45;
    v179 = 2114;
    v180 = v169;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "[%{public}@] Opened SQLite file at %{public}@", buf, 0x16u);

    v22 = &NSStringFromSelector_ptr;
    a2 = v41;

  }
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByDeletingLastPathComponent"));
  v47 = objc_msgSend(v17, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v46, 1, 0, a6);

  if ((v47 & 1) == 0)
    goto LABEL_23;
  aSelector = a2;
  v48 = &NSStringFromSelector_ptr;
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v50 = v49;
  while (1)
  {
    v51 = _sqlite3_db_clone(ppDb, 0, v20, 16777227);
    if ((_DWORD)v51 != 5)
    {
      v61 = v51;
      if (!(_DWORD)v51)
      {
        v62 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22[282], "container"));
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          v64 = (objc_class *)objc_opt_class(v168, v63);
          v65 = NSStringFromClass(v64);
          v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
          v67 = NSStringFromSelector(aSelector);
          v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
          v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v66, v68));
          *(_DWORD *)buf = 138543618;
          v178 = v69;
          v179 = 2114;
          v180 = v19;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "[%{public}@] Cloning SQLite file to %{public}@", buf, 0x16u);

          v22 = &NSStringFromSelector_ptr;
        }

        v70 = sqlite3_open_v2(v20, &db, 6, 0);
        if (!(_DWORD)v70)
        {
          v78 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22[282], "container"));
          if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
          {
            v80 = (objc_class *)objc_opt_class(v168, v79);
            v81 = NSStringFromClass(v80);
            v82 = (void *)objc_claimAutoreleasedReturnValue(v81);
            v83 = NSStringFromSelector(aSelector);
            v84 = (void *)objc_claimAutoreleasedReturnValue(v83);
            v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v82, v84));
            *(_DWORD *)buf = 138543874;
            v178 = v85;
            v179 = 2114;
            v180 = v19;
            v181 = 1024;
            LODWORD(v182) = 6;
            _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "[%{public}@] Opened SQLite file for copying at %{public}@ with flags 0x%x", buf, 0x1Cu);

          }
          v86 = sqlite3_wal_checkpoint_v2(db, 0, 2, 0, 0);
          if ((_DWORD)v86)
          {
            if (!a6)
              goto LABEL_57;
            v87 = v86;
            v88 = sqlite3_errmsg(db);
            v164 = sqlite3_extended_errcode(db);
            v165 = v87;
            v163 = v88;
            v76 = CFSTR("Error checkpointing copied SQLite file: %s,%d (%d)");
            v77 = -104;
          }
          else
          {
            v90 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22[282], "container"));
            if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
            {
              v92 = (objc_class *)objc_opt_class(v168, v91);
              v93 = NSStringFromClass(v92);
              v94 = (void *)objc_claimAutoreleasedReturnValue(v93);
              v95 = NSStringFromSelector(aSelector);
              v96 = (void *)objc_claimAutoreleasedReturnValue(v95);
              v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v94, v96));
              *(_DWORD *)buf = 138543618;
              v178 = v97;
              v179 = 2114;
              v180 = v169;
              _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_INFO, "[%{public}@] Checkpointed copied SQLite file at %{public}@", buf, 0x16u);

            }
            v98 = sqlite3_close(db);
            db = 0;
            if (!(_DWORD)v98)
            {
              v145 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22[282], "container"));
              if (os_log_type_enabled(v145, OS_LOG_TYPE_INFO))
              {
                v147 = (objc_class *)objc_opt_class(v168, v146);
                v148 = NSStringFromClass(v147);
                v149 = (void *)objc_claimAutoreleasedReturnValue(v148);
                v150 = NSStringFromSelector(aSelector);
                v151 = (void *)objc_claimAutoreleasedReturnValue(v150);
                v152 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v149, v151));
                *(_DWORD *)buf = 138543618;
                v178 = v152;
                v179 = 2114;
                v180 = v19;
                _os_log_impl((void *)&_mh_execute_header, v145, OS_LOG_TYPE_INFO, "[%{public}@] Closed SQLite file at %{public}@", buf, 0x16u);

              }
              +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
              v154 = v153;
              v155 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22[282], "container"));
              if (os_log_type_enabled(v155, OS_LOG_TYPE_INFO))
              {
                v157 = (objc_class *)objc_opt_class(v168, v156);
                v158 = NSStringFromClass(v157);
                v159 = (void *)objc_claimAutoreleasedReturnValue(v158);
                v160 = NSStringFromSelector(aSelector);
                v161 = (void *)objc_claimAutoreleasedReturnValue(v160);
                v162 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v159, v161));
                *(_DWORD *)buf = 138543874;
                v178 = v162;
                v179 = 2112;
                v180 = v169;
                v181 = 2048;
                v182 = v154 - v50;
                _os_log_impl((void *)&_mh_execute_header, v155, OS_LOG_TYPE_INFO, "[%{public}@] Finished copying SQLite database at %@ in %0.3fs", buf, 0x20u);

              }
              v25 = 1;
              goto LABEL_58;
            }
            if (!a6)
              goto LABEL_57;
            v99 = v98;
            v100 = sqlite3_errmsg(0);
            v164 = sqlite3_extended_errcode(db);
            v165 = v99;
            v163 = v100;
            v76 = CFSTR("Error closing copied SQLite file: %s,%d (%d)");
            v77 = -105;
          }
          goto LABEL_50;
        }
        if (!a6)
          goto LABEL_57;
        v71 = v70;
        if (db)
        {
          v72 = sqlite3_errmsg(db);
          if (db)
          {
            v73 = sqlite3_extended_errcode(db);
LABEL_49:
            v164 = v73;
            v165 = v71;
            v163 = v72;
            v76 = CFSTR("Error opening SQLite file: %s,%d (%d)");
            v77 = -101;
LABEL_50:
            v89 = v19;
            goto LABEL_51;
          }
        }
        else
        {
          v72 = 0;
        }
        v73 = 0xFFFFFFFFLL;
        goto LABEL_49;
      }
      if (!a6)
        goto LABEL_57;
      if (ppDb)
      {
        v74 = sqlite3_errmsg(ppDb);
        if (ppDb)
        {
          v75 = sqlite3_extended_errcode(ppDb);
          goto LABEL_45;
        }
      }
      else
      {
        v74 = 0;
      }
      v75 = 0xFFFFFFFFLL;
LABEL_45:
      v164 = v75;
      v165 = v61;
      v163 = v74;
      v76 = CFSTR("Error cloning SQLite file: %s,%d (%d)");
      v77 = -103;
LABEL_46:
      v89 = v169;
LABEL_51:
      v25 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[REMError sqliteErrorWithCode:path:format:](REMError, "sqliteErrorWithCode:path:format:", v77, v89, v76, v163, v164, v165));
      goto LABEL_58;
    }
    objc_msgSend(v48[112], "timeIntervalSinceReferenceDate");
    if (v52 - v50 >= a5)
      break;
    v53 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22[282], "container"));
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      v55 = (objc_class *)objc_opt_class(v168, v54);
      v56 = NSStringFromClass(v55);
      v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
      v58 = NSStringFromSelector(aSelector);
      v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v57, v59));
      *(_DWORD *)buf = 138543618;
      v178 = v60;
      v179 = 2114;
      v180 = v169;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "[%{public}@] Waiting for busy SQLite database at %{public}@", buf, 0x16u);

      v48 = &NSStringFromSelector_ptr;
      v22 = &NSStringFromSelector_ptr;
    }

    +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:", 0.1);
  }
  if (a6)
  {
    v76 = CFSTR("SQLite file is busy");
    v77 = -102;
    goto LABEL_46;
  }
LABEL_57:
  v25 = 0;
LABEL_58:
  a2 = aSelector;
LABEL_59:
  if (ppDb)
  {
    v101 = sqlite3_close(ppDb);
    v102 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22[282], "container"));
    v103 = v102;
    if (v101)
    {
      if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
      {
        v105 = (objc_class *)objc_opt_class(v168, v104);
        v106 = NSStringFromClass(v105);
        v107 = a2;
        v108 = (void *)objc_claimAutoreleasedReturnValue(v106);
        v109 = NSStringFromSelector(v107);
        v110 = (void *)objc_claimAutoreleasedReturnValue(v109);
        v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v108, v110));
        *(_DWORD *)buf = 138543874;
        v178 = v111;
        v179 = 2114;
        v180 = v169;
        v181 = 1024;
        LODWORD(v182) = v101;
        _os_log_error_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_ERROR, "[%{public}@] Warn: Error closing SQLite file at %{public}@: %d", buf, 0x1Cu);

        v22 = &NSStringFromSelector_ptr;
        a2 = v107;

      }
    }
    else if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
    {
      v113 = (objc_class *)objc_opt_class(v168, v112);
      v114 = NSStringFromClass(v113);
      v115 = (void *)objc_claimAutoreleasedReturnValue(v114);
      v116 = NSStringFromSelector(a2);
      v117 = a2;
      v118 = (void *)objc_claimAutoreleasedReturnValue(v116);
      v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v115, v118));
      *(_DWORD *)buf = 138543618;
      v178 = v119;
      v179 = 2114;
      v180 = v169;
      _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_INFO, "[%{public}@] Closed SQLite file at %{public}@", buf, 0x16u);

      a2 = v117;
    }

  }
  if (db)
  {
    v120 = sqlite3_close(db);
    v121 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22[282], "container"));
    v122 = v121;
    if (v120)
    {
      if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
      {
        v124 = (objc_class *)objc_opt_class(v168, v123);
        v125 = NSStringFromClass(v124);
        v126 = objc_claimAutoreleasedReturnValue(v125);
        v127 = a2;
        v128 = (void *)v126;
        v129 = NSStringFromSelector(v127);
        v130 = (void *)objc_claimAutoreleasedReturnValue(v129);
        v131 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v128, v130));
        *(_DWORD *)buf = 138543874;
        v178 = v131;
        v179 = 2114;
        v180 = v19;
        v181 = 1024;
        LODWORD(v182) = v120;
        _os_log_error_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_ERROR, "[%{public}@] Warn: Error closing SQLite file at %{public}@: %d", buf, 0x1Cu);

      }
    }
    else if (os_log_type_enabled(v121, OS_LOG_TYPE_INFO))
    {
      v133 = (objc_class *)objc_opt_class(v168, v132);
      v134 = NSStringFromClass(v133);
      v135 = (void *)objc_claimAutoreleasedReturnValue(v134);
      v136 = NSStringFromSelector(a2);
      v137 = (void *)objc_claimAutoreleasedReturnValue(v136);
      v138 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v135, v137));
      *(_DWORD *)buf = 138543618;
      v178 = v138;
      v179 = 2114;
      v180 = v19;
      _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_INFO, "[%{public}@] Closed SQLite file at %{public}@", buf, 0x16u);

    }
  }
  if (!v25)
  {
    objc_msgSend(v17, "removeItemAtPath:error:", v19, 0);
    v170 = 0u;
    v171 = 0u;
    v172 = 0u;
    v173 = 0u;
    v139 = objc_msgSend(&off_100804C48, "countByEnumeratingWithState:objects:count:", &v170, v176, 16);
    if (v139)
    {
      v140 = v139;
      v141 = *(_QWORD *)v171;
      do
      {
        for (i = 0; i != v140; i = (char *)i + 1)
        {
          if (*(_QWORD *)v171 != v141)
            objc_enumerationMutation(&off_100804C48);
          v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v170 + 1) + 8 * (_QWORD)i)));
          objc_msgSend(v17, "removeItemAtPath:error:", v143, 0);

        }
        v140 = objc_msgSend(&off_100804C48, "countByEnumeratingWithState:objects:count:", &v170, v176, 16);
      }
      while (v140);
    }
  }

  v14 = v167;
LABEL_82:

  return v25;
}

@end
