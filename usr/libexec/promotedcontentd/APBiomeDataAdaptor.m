@implementation APBiomeDataAdaptor

- (BOOL)_validateParameters:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int isKindOfClass;
  _BOOL4 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)APBiomeDataAdaptor;
  if (-[APDataAdaptor _validateParameters:](&v31, "_validateParameters:"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("startDate")));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("startDate")));
      v9 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      {
        isKindOfClass = 1;
      }
      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("startDate")));
        v14 = objc_opt_class(NSDate);
        isKindOfClass = objc_opt_isKindOfClass(v13, v14);

      }
    }
    else
    {
      isKindOfClass = 1;
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("endDate")));
    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("endDate")));
      v19 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v18, v19) & 1) == 0)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("endDate")));
        v22 = objc_opt_class(NSDate);
        isKindOfClass &= objc_opt_isKindOfClass(v21, v22);

      }
    }

    v23 = objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v23, "objectForKeyedSubscript:", CFSTR("maxEvents")));
    v25 = isKindOfClass & -[APDataAdaptor _checkClassType:name:expectedClass:error:](self, "_checkClassType:name:expectedClass:error:", v24, CFSTR("maxEvents"), objc_opt_class(NSNumber), a3);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("lastN")));
    LODWORD(v23) = -[APDataAdaptor _checkClassType:name:expectedClass:error:](self, "_checkClassType:name:expectedClass:error:", v27, CFSTR("lastN"), objc_opt_class(NSNumber), a3);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("reverse")));
    v11 = v25 & v23 & -[APDataAdaptor _checkClassType:name:expectedClass:error:](self, "_checkClassType:name:expectedClass:error:", v29, CFSTR("reverse"), objc_opt_class(NSNumber), a3);

  }
  else
  {
    LOBYTE(v11) = 0;
  }
  return v11;
}

- (void)_run:(id)a3
{
  id v4;
  id handler;
  void *v6;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  char v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void (**v61)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v62;
  uint64_t v63;
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[5];
  id v68;
  NSErrorUserInfoKey v69;
  const __CFString *v70;

  v64 = a3;
  v4 = objc_retainBlock(v64);
  handler = self->_handler;
  self->_handler = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("startDate")));
  v8 = objc_opt_class(NSString);
  isKindOfClass = objc_opt_isKindOfClass(v7, v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("startDate")));

  if ((isKindOfClass & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  if ((isKindOfClass & 1) != 0)
    v13 = 0;
  else
    v13 = (void *)v11;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("endDate")));
  v16 = objc_opt_class(NSString);
  v17 = objc_opt_isKindOfClass(v15, v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("endDate")));
  if ((v17 & 1) != 0)
    v20 = v19;
  else
    v20 = 0;
  if ((v17 & 1) != 0)
    v21 = 0;
  else
    v21 = (void *)v19;

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("maxEvents")));
  v24 = objc_opt_class(NSNumber);
  v25 = objc_opt_isKindOfClass(v23, v24);

  v26 = 0;
  if ((v25 & 1) != 0)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("maxEvents")));
    v26 = objc_msgSend(v28, "unsignedIntValue");

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("lastN")));
  v31 = objc_opt_class(NSNumber);
  v32 = objc_opt_isKindOfClass(v30, v31);

  if ((v32 & 1) != 0)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("lastN")));
    v62 = objc_msgSend(v34, "unsignedIntValue");

  }
  else
  {
    v62 = 0;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters", v62));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("reverse")));
  v37 = objc_opt_class(NSNumber);
  v38 = objc_opt_isKindOfClass(v36, v37);

  if ((v38 & 1) != 0)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("reverse")));
    v41 = objc_msgSend(v40, "BOOLValue");

  }
  else
  {
    v41 = 0;
  }
  if (!(v12 | v20))
  {
    v42 = 0;
    goto LABEL_36;
  }
  v42 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v42, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  if (v12)
  {
    v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "dateFromString:", v12));

    if (v43)
    {
      v45 = 0;
      v13 = (void *)v43;
      if (!v20)
        goto LABEL_32;
    }
    else
    {
      v46 = sub_10008BE28(v44, v12);
      v45 = (void *)objc_claimAutoreleasedReturnValue(v46);
      v13 = 0;
      if (!v20)
        goto LABEL_32;
    }
  }
  else
  {
    v45 = 0;
    if (!v20)
    {
LABEL_32:
      if (v45)
        goto LABEL_33;
LABEL_36:
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[APBiomeDataAdaptor _biomeStream](self, "_biomeStream"));
      -[APBiomeDataAdaptor setStream:](self, "setStream:", v53);

      v54 = (void *)objc_claimAutoreleasedReturnValue(-[APBiomeDataAdaptor stream](self, "stream"));
      if (v54)
      {
        v55 = objc_msgSend(objc_alloc((Class)BMPublisherOptions), "initWithStartDate:endDate:maxEvents:lastN:reversed:", v13, v21, v26, v63, v41);
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[APBiomeDataAdaptor stream](self, "stream"));
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "publisherWithOptions:", v55));

        v67[0] = _NSConcreteStackBlock;
        v67[1] = 3221225472;
        v67[2] = sub_10008BF08;
        v67[3] = &unk_1002130F8;
        v67[4] = self;
        v50 = v64;
        v68 = v64;
        v65[0] = _NSConcreteStackBlock;
        v65[1] = 3221225472;
        v65[2] = sub_10008C07C;
        v65[3] = &unk_100213140;
        v66 = v68;
        v58 = objc_msgSend(v57, "sinkWithCompletion:receiveInput:", v67, v65);

        v45 = 0;
        goto LABEL_41;
      }
      v69 = NSLocalizedDescriptionKey;
      v70 = CFSTR("Biome stream must not be nil.");
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1));
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.dataadaptors"), 5200, v59));

      v60 = (void *)objc_claimAutoreleasedReturnValue(-[APBiomeDataAdaptor handler](self, "handler"));
      if (v60)
      {
        v61 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[APBiomeDataAdaptor handler](self, "handler"));
        ((void (**)(_QWORD, _QWORD, _QWORD, void *))v61)[2](v61, 0, 0, v45);

      }
LABEL_40:
      v50 = v64;
      goto LABEL_41;
    }
  }
  v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "dateFromString:", v20));

  if (v47)
  {
    v21 = (void *)v47;
    goto LABEL_32;
  }
  v51 = sub_10008BE28(v48, v20);
  v52 = objc_claimAutoreleasedReturnValue(v51);

  v21 = 0;
  v45 = (void *)v52;
  if (!v52)
    goto LABEL_36;
LABEL_33:
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[APBiomeDataAdaptor handler](self, "handler"));

  if (!v49)
    goto LABEL_40;
  v50 = v64;
  (*((void (**)(id, _QWORD, _QWORD, void *))v64 + 2))(v64, 0, 0, v45);
LABEL_41:

}

- (BOOL)addData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  uint64_t v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  uint64_t v16;
  char isKindOfClass;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  objc_class *v24;
  NSString *v25;
  void *v26;
  int v28;
  uint64_t v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APBiomeDataAdaptor _biomeStream](self, "_biomeStream"));
  -[APBiomeDataAdaptor setStream:](self, "setStream:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APBiomeDataAdaptor stream](self, "stream"));
  if (!v6)
  {
    v12 = APLogForCategory(46);
    v10 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v28 = 138477827;
      v29 = objc_opt_class(self);
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error creating stream %{private}@", (uint8_t *)&v28, 0xCu);
    }
    goto LABEL_15;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APBiomeDataAdaptor stream](self, "stream"));
  v8 = objc_opt_respondsToSelector(v7, "source");

  if ((v8 & 1) == 0)
  {
    v13 = (objc_class *)objc_opt_class(self);
    v14 = NSStringFromClass(v13);
    v10 = objc_claimAutoreleasedReturnValue(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[APBiomeDataAdaptor stream](self, "stream"));
    v16 = objc_opt_class(BMStream);
    isKindOfClass = objc_opt_isKindOfClass(v15, v16);

    if ((isKindOfClass & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[APBiomeDataAdaptor stream](self, "stream"));
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));

      v10 = v19;
    }
    v20 = APLogForCategory(46);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 138412290;
      v29 = (uint64_t)v10;
    }

    goto LABEL_15;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APBiomeDataAdaptor stream](self, "stream"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "source"));

  if (!v10)
  {
    v22 = APLogForCategory(46);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (objc_class *)objc_opt_class(self);
      v25 = NSStringFromClass(v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v28 = 138412290;
      v29 = (uint64_t)v26;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Stream for %@ does not have a source", (uint8_t *)&v28, 0xCu);

    }
LABEL_15:
    v11 = 0;
    goto LABEL_16;
  }
  -[NSObject sendEvent:](v10, "sendEvent:", v4);
  v11 = 1;
LABEL_16:

  return v11;
}

- (BOOL)allowEmptyParameters
{
  return 1;
}

- (void)clearAllData
{
  -[APBiomeDataAdaptor clearDataWithPredicate:](self, "clearDataWithPredicate:", &stru_100213180);
}

- (void)clearDataWithPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  objc_super v12;
  _QWORD block[5];

  v4 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008C638;
  block[3] = &unk_100212FE0;
  block[4] = self;
  if (qword_1002687B0 != -1)
    dispatch_once(&qword_1002687B0, block);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APBiomeDataAdaptor stream](self, "stream"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pruner"));
  v7 = objc_opt_respondsToSelector(v6, "deleteEventsPassingTest:");

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[APBiomeDataAdaptor stream](self, "stream"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pruner"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10008C6A4;
    v10[3] = &unk_1002131A8;
    v11 = v4;
    objc_msgSend(v9, "deleteEventsPassingTest:", v10);

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)APBiomeDataAdaptor;
    -[APDataAdaptor clearAllData](&v12, "clearAllData");
  }

}

- (id)_biomeStream
{
  return 0;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BMStream)stream
{
  return self->_stream;
}

- (void)setStream:(id)a3
{
  objc_storeStrong((id *)&self->_stream, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
