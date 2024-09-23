@implementation HAPCharacteristic

- (void)_updateMetadata:(id)a3 withProvidedMetadata:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;

  v40 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "format"));

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "format"));
    objc_msgSend(v40, "setFormat:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "units"));

  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "units"));
    objc_msgSend(v40, "setUnits:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "manufacturerDescription"));

  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "manufacturerDescription"));
    objc_msgSend(v40, "setManufacturerDescription:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraints"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraints"));
  v14 = v13;
  if (!v12)
  {
    objc_msgSend(v40, "setConstraints:", v13);
    goto LABEL_20;
  }

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraints"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "minimumValue"));

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraints"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "minimumValue"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraints"));
      objc_msgSend(v19, "setMinimumValue:", v18);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraints"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "maximumValue"));

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraints"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "maximumValue"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraints"));
      objc_msgSend(v24, "setMaximumValue:", v23);

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraints"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stepValue"));

    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraints"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stepValue"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraints"));
      objc_msgSend(v29, "setStepValue:", v28);

    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraints"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "maxLength"));

    if (v31)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraints"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "maxLength"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraints"));
      objc_msgSend(v34, "setMaxLength:", v33);

    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraints"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "validValues"));
    v37 = objc_msgSend(v36, "count");

    if (v37)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraints"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "validValues"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraints"));
      objc_msgSend(v39, "setValidValues:", v38);

LABEL_20:
    }
  }

}

- (id)_generateValidMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[HAPMetadata getSharedInstance](HAPMetadata, "getSharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic type](self, "type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getDefaultCharacteristicMetadata:", v6));

  v8 = v4;
  if (v7)
  {
    v8 = v7;
    if (v4)
    {
      -[HAPCharacteristic _updateMetadata:withProvidedMetadata:](self, "_updateMetadata:withProvidedMetadata:", v7, v4);
      v8 = v7;
    }
  }
  v9 = v8;

  return v9;
}

- (id)validateValue:(id)a3 outValue:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  _QWORD *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  NSObject *v45;
  __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  unsigned __int8 v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  id v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  NSObject *v81;
  __CFString *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  id v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  id v94;
  uint64_t v95;
  id v96;
  NSObject *v97;
  __CFString *v98;
  void *v99;
  uint64_t v100;
  id v101;
  NSObject *v102;
  __CFString *v103;
  void *v104;
  id v105;
  uint64_t v106;
  id v107;
  NSObject *v108;
  __CFString *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  id *v116;
  void *v117;
  uint8_t buf[4];
  void *v119;
  __int16 v120;
  id v121;
  __int16 v122;
  id v123;
  __int16 v124;
  id v125;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[HAPCharacteristic metadata](self, "metadata"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = objc_claimAutoreleasedReturnValue(-[HAPCharacteristic metadata](self, "metadata"));
    if (v9)
    {
      v10 = (void *)v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic metadata](self, "metadata"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "format"));

      if (!v12)
        goto LABEL_4;
    }
    else
    {

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic metadata](self, "metadata"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "format"));

    if (a4)
      *a4 = 0;
    if (!v6)
    {
      v13 = 0;
LABEL_67:

      goto LABEL_68;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic metadata](self, "metadata"));
    v116 = a4;
    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic metadata](self, "metadata"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraints"));

      if (v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic metadata](self, "metadata"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraints"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "minimumValue"));

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic metadata](self, "metadata"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraints"));
        v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "maximumValue"));

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic metadata](self, "metadata"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraints"));
        v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "minLength"));

        v27 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic metadata](self, "metadata"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraints"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "maxLength"));

        v30 = (void *)v26;
      }
      else
      {
        v29 = 0;
        v30 = 0;
        v23 = 0;
        v16 = 0;
      }
    }
    else
    {
      v29 = 0;
      v30 = 0;
      v23 = 0;
    }
    v117 = v6;
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("int")) & 1) != 0
      || (objc_msgSend(v15, "isEqualToString:", CFSTR("float")) & 1) != 0
      || (objc_msgSend(v15, "isEqualToString:", CFSTR("BOOL")) & 1) != 0
      || (objc_msgSend(v15, "isEqualToString:", CFSTR("int8")) & 1) != 0
      || (objc_msgSend(v15, "isEqualToString:", CFSTR("int16")) & 1) != 0
      || (objc_msgSend(v15, "isEqualToString:", CFSTR("int64")) & 1) != 0
      || (objc_msgSend(v15, "isEqualToString:", CFSTR("uint8")) & 1) != 0
      || (objc_msgSend(v15, "isEqualToString:", CFSTR("uint16")) & 1) != 0
      || (objc_msgSend(v15, "isEqualToString:", CFSTR("uint32")) & 1) != 0
      || (objc_msgSend(v15, "isEqualToString:", CFSTR("uint64")) & 1) != 0)
    {
      v32 = v15;
      v33 = (void *)v23;
      v34 = NSNumber_ptr;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("string")) & 1) != 0)
    {
      v32 = v15;
      v33 = (void *)v23;
      v34 = NSString_ptr;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("date")) & 1) != 0)
    {
      v32 = v15;
      v33 = (void *)v23;
      v34 = NSDate_ptr;
    }
    else
    {
      v33 = (void *)v23;
      v32 = v15;
      if ((objc_msgSend(v15, "isEqualToString:", CFSTR("array")) & 1) != 0)
      {
        v34 = NSArray_ptr;
      }
      else
      {
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("dict")) & 1) != 0)
        {
          v34 = NSObject_ptr;
        }
        else
        {
          if ((objc_msgSend(v15, "isEqualToString:", CFSTR("data")) & 1) == 0
            && !objc_msgSend(v15, "isEqualToString:", CFSTR("tlv8")))
          {
            v35 = 0;
            v32 = v15;
LABEL_29:
            if ((objc_msgSend((id)objc_opt_class(v117, v31), "isSubclassOfClass:", v35) & 1) == 0)
            {
              v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), 35, 0));
              v44 = sub_10007CCE4(0, v43);
              v45 = objc_claimAutoreleasedReturnValue(v44);
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                v46 = sub_10007CD2C(0);
                v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
                v114 = v29;
                v48 = v30;
                v49 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic type](self, "type"));
                *(_DWORD *)buf = 138544130;
                v119 = v47;
                v120 = 2112;
                v121 = v49;
                v122 = 2112;
                v123 = (id)objc_opt_class(v117, v50);
                v124 = 2112;
                v125 = (id)v35;
                v51 = v123;
                _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%{public}@### Failed to validate value for characteristic with type '%@' because the value was of class '%@' but should be '%@'", buf, 0x2Au);

                v30 = v48;
                v29 = v114;

              }
              v36 = v33;
              v15 = v32;
              goto LABEL_37;
            }
            v36 = v33;
            v15 = v32;
            v6 = v117;
            if (!v116)
            {
LABEL_49:
              if ((objc_msgSend(v32, "isEqualToString:", CFSTR("int")) & 1) != 0
                || (objc_msgSend(v32, "isEqualToString:", CFSTR("float")) & 1) != 0
                || (objc_msgSend(v32, "isEqualToString:", CFSTR("int8")) & 1) != 0
                || (objc_msgSend(v32, "isEqualToString:", CFSTR("int16")) & 1) != 0
                || (objc_msgSend(v32, "isEqualToString:", CFSTR("int64")) & 1) != 0
                || (objc_msgSend(v32, "isEqualToString:", CFSTR("uint8")) & 1) != 0
                || (objc_msgSend(v32, "isEqualToString:", CFSTR("uint16")) & 1) != 0
                || (objc_msgSend(v32, "isEqualToString:", CFSTR("uint32")) & 1) != 0
                || objc_msgSend(v32, "isEqualToString:", CFSTR("uint64")))
              {
                if (v16 && objc_msgSend(v117, "compare:", v16) == (id)-1)
                {
                  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), 47, 0));
                  if (v116)
                    *v116 = 0;
                }
                else
                {
                  v70 = 0;
                }
                if (v36 && objc_msgSend(v117, "compare:", v36) == (id)1)
                {
                  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), 48, 0));

                  if (v116)
                    *v116 = 0;
                }
                else
                {
                  v42 = v70;
                }
                goto LABEL_66;
              }
              if (objc_msgSend(v32, "isEqualToString:", CFSTR("BOOL")))
              {
                v73 = (void *)objc_opt_class(v117, v72);
                if ((objc_msgSend(v73, "isSubclassOfClass:", objc_opt_class(&__kCFBooleanTrue, v74)) & 1) == 0)
                {
                  v115 = v29;
                  v76 = v36;
                  v77 = v16;
                  if (objc_msgSend(v73, "isSubclassOfClass:", objc_opt_class(NSNumber, v75)))
                  {
                    if (objc_msgSend(v117, "intValue") < 2)
                    {
                      v42 = 0;
LABEL_104:
                      v16 = v77;
                      v36 = v76;
                      v15 = v32;
LABEL_107:
                      v29 = v115;
LABEL_37:
                      v6 = v117;
LABEL_66:
                      v13 = v42;

                      goto LABEL_67;
                    }
                    v80 = sub_10007CCE4(0, v79);
                    v81 = objc_claimAutoreleasedReturnValue(v80);
                    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
                    {
                      v82 = sub_10007CD2C(0);
                      v83 = (void *)objc_claimAutoreleasedReturnValue(v82);
                      v85 = (void *)objc_opt_class(v117, v84);
                      v86 = objc_retainAutorelease(v117);
                      v87 = v85;
                      *(_DWORD *)buf = 138544130;
                      v119 = v83;
                      v120 = 2112;
                      v121 = v117;
                      v122 = 2112;
                      v123 = v85;
                      v124 = 2080;
                      v125 = objc_msgSend(v86, "objCType");
                      _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "%{public}@Value to be validated is expected to be either '0' or '1', instead it was '%@' - class %@  objCType %s", buf, 0x2Au);

                    }
                  }
                  else
                  {
                    v101 = sub_10007CCE4(0, v78);
                    v102 = objc_claimAutoreleasedReturnValue(v101);
                    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
                    {
                      v103 = sub_10007CD2C(0);
                      v104 = (void *)objc_claimAutoreleasedReturnValue(v103);
                      *(_DWORD *)buf = 138543874;
                      v119 = v104;
                      v120 = 2112;
                      v121 = v117;
                      v122 = 2112;
                      v123 = v73;
                      _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_ERROR, "%{public}@inValue not a BOOLean value %@ - class %@", buf, 0x20u);

                    }
                  }
                  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), 2, 0));
                  if (v116)
                    *v116 = 0;
                  goto LABEL_104;
                }
LABEL_87:
                v42 = 0;
                goto LABEL_66;
              }
              if (!objc_msgSend(v32, "isEqualToString:", CFSTR("string")))
                goto LABEL_87;
              v88 = v36;
              v89 = v30;
              v90 = v16;
              v91 = v29;
              v92 = v88;
              v93 = v117;
              v94 = objc_msgSend(v93, "length");
              v115 = v91;
              if ((unint64_t)v94 <= objc_msgSend(v91, "unsignedIntValue"))
              {
                v105 = objc_msgSend(v93, "length");
                if ((unint64_t)v105 >= objc_msgSend(v89, "unsignedIntValue"))
                {
                  v42 = 0;
LABEL_106:

                  v16 = v90;
                  v30 = v89;
                  v36 = v92;
                  goto LABEL_107;
                }
                v107 = sub_10007CCE4(0, v106);
                v108 = objc_claimAutoreleasedReturnValue(v107);
                if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
                {
                  v109 = sub_10007CD2C(0);
                  v110 = (void *)objc_claimAutoreleasedReturnValue(v109);
                  *(_DWORD *)buf = 138543874;
                  v119 = v110;
                  v120 = 2048;
                  v121 = objc_msgSend(v93, "length");
                  v122 = 1024;
                  LODWORD(v123) = objc_msgSend(v89, "unsignedIntValue");
                  _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_ERROR, "%{public}@inValue string.length: %lu < minLength: %u", buf, 0x1Cu);

                }
                v100 = 50;
              }
              else
              {
                v96 = sub_10007CCE4(0, v95);
                v97 = objc_claimAutoreleasedReturnValue(v96);
                if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
                {
                  v98 = sub_10007CD2C(0);
                  v99 = (void *)objc_claimAutoreleasedReturnValue(v98);
                  *(_DWORD *)buf = 138543874;
                  v119 = v99;
                  v120 = 2048;
                  v121 = objc_msgSend(v93, "length");
                  v122 = 1024;
                  LODWORD(v123) = objc_msgSend(v115, "unsignedIntValue");
                  _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, "%{public}@inValue string.length: %lu > maxLength: %u", buf, 0x1Cu);

                }
                v100 = 49;
              }
              v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), v100, 0));
              if (v116)
                *v116 = 0;
              goto LABEL_106;
            }
            v111 = v30;
            v112 = v36;
            v37 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic metadata](self, "metadata"));
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraints"));
            v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "stepValue"));
            v113 = v29;
            if (v39)
            {
              v40 = (void *)v39;
              v41 = v16;
              if ((objc_msgSend(v32, "isEqualToString:", CFSTR("float")) & 1) != 0)
              {

LABEL_40:
                v53 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic metadata](self, "metadata"));
                v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraints"));
                v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "stepValue"));
                objc_msgSend(v55, "doubleValue");
                v57 = v56;

                v58 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic metadata](self, "metadata"));
                v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraints"));
                v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "minimumValue"));

                if (v60)
                {
                  v61 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic metadata](self, "metadata"));
                  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraints"));
                  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "minimumValue"));
                  objc_msgSend(v63, "doubleValue");
                  v65 = v64;

                }
                else
                {
                  v65 = 0.0;
                }
                objc_msgSend(v117, "doubleValue");
                v68 = v65 + round((v67 - v65) / v57) * v57;
                v16 = v41;
                v30 = v111;
                v29 = v113;
                if (objc_msgSend(v32, "isEqualToString:", CFSTR("int")))
                  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (uint64_t)v68));
                else
                  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v68));
                v36 = v112;
                v66 = v69;
                goto LABEL_48;
              }
              v52 = objc_msgSend(v32, "isEqualToString:", CFSTR("int"));

              if ((v52 & 1) != 0)
                goto LABEL_40;
            }
            else
            {
              v41 = v16;

            }
            v66 = objc_retainAutorelease(v117);
            v16 = v41;
            v30 = v111;
            v36 = v112;
            v29 = v113;
LABEL_48:
            *v116 = v66;
            goto LABEL_49;
          }
          v34 = NSData_ptr;
        }
        v32 = v15;
      }
    }
    v35 = objc_opt_class(*v34, v31);
    goto LABEL_29;
  }
LABEL_4:
  v13 = 0;
  if (a4)
    *a4 = objc_retainAutorelease(v6);
LABEL_68:

  return v13;
}

- (CBCharacteristic)cbCharacteristic
{
  id AssociatedObject;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  AssociatedObject = objc_getAssociatedObject(self, "cbCharacteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v5 = objc_opt_class(CBCharacteristic, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    v6 = v3;
  else
    v6 = 0;

  return (CBCharacteristic *)v6;
}

- (void)setCBCharacteristic:(id)a3
{
  objc_setAssociatedObject(self, "cbCharacteristic", a3, (void *)1);
}

- (HAPCharacteristic)initWithType:(id)a3 instanceID:(id)a4 value:(id)a5 stateNumber:(id)a6 properties:(unint64_t)a7 eventNotificationsEnabled:(BOOL)a8 metadata:(id)a9
{
  uint64_t v10;

  LOBYTE(v10) = 0;
  return -[HAPCharacteristic initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:](self, "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:", a3, a4, a5, a6, a7, a8, v10, a9);
}

- (HAPCharacteristic)initWithType:(id)a3 instanceID:(id)a4 value:(id)a5 stateNumber:(id)a6 properties:(unint64_t)a7 eventNotificationsEnabled:(BOOL)a8 implicitWriteWithResponse:(BOOL)a9 metadata:(id)a10
{
  NSObject *v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  HAPCharacteristic *v27;
  void *v28;
  uint64_t v29;
  NSString *type;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  NSObject *v35;
  __CFString *v36;
  NSString *v37;
  uint64_t v38;
  NSDate *valueUpdatedTime;
  uint64_t v40;
  HAPCharacteristicMetadata *accessoryMetadata;
  void *v42;
  uint64_t v43;
  HAPCharacteristicMetadata *metadata;
  HAPCharacteristic *v45;
  id v46;
  __CFString *v47;
  NSObject *v48;
  id v49;
  __CFString *v50;
  NSObject *v51;
  const char *v52;
  NSObject *v53;
  uint32_t v54;
  id v55;
  __CFString *v56;
  id v57;
  __CFString *v58;
  uint64_t v60;
  id v61;
  NSObject *v62;
  __CFString *v63;
  NSObject *v64;
  uint64_t v65;
  id v66;
  __CFString *v67;
  NSObject *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  objc_super v76;
  uint8_t buf[4];
  NSObject *v78;
  __int16 v79;
  NSObject *v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  id v84;

  v16 = a3;
  v17 = a4;
  v75 = a5;
  v74 = a6;
  v18 = a10;
  if ((sub_10007B894(v16) & 1) == 0)
  {
    v46 = sub_10007CCE4(0, v19);
    v22 = objc_claimAutoreleasedReturnValue(v46);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
LABEL_28:
      v45 = 0;
      goto LABEL_29;
    }
    v47 = sub_10007CD2C(0);
    v48 = objc_claimAutoreleasedReturnValue(v47);
    *(_DWORD *)buf = 138543618;
    v78 = v48;
    v79 = 2112;
    v80 = v16;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}@### Unable to initialize characteristic because of invalid characteristic type name: %@", buf, 0x16u);
    goto LABEL_27;
  }
  v20 = sub_10007BA30(v16);
  v22 = objc_claimAutoreleasedReturnValue(v20);
  if (!v22)
  {
    v49 = sub_10007CCE4(0, v21);
    v48 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v50 = sub_10007CD2C(0);
      v51 = objc_claimAutoreleasedReturnValue(v50);
      *(_DWORD *)buf = 138543362;
      v78 = v51;
      v52 = "%{public}@### Unable to initialize characteristic because type name is not a UUID";
      v53 = v48;
      v54 = 12;
LABEL_26:
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, v52, buf, v54);

      goto LABEL_27;
    }
    goto LABEL_27;
  }
  if ((sub_10007BD14(v17) & 1) == 0)
  {
    v55 = sub_10007CCE4(0, v23);
    v48 = objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v56 = sub_10007CD2C(0);
      v51 = objc_claimAutoreleasedReturnValue(v56);
      *(_DWORD *)buf = 138543618;
      v78 = v51;
      v79 = 2112;
      v80 = v22;
      v52 = "%{public}@### Unable to initialize characteristic '%@' because of invalid instance ID";
LABEL_25:
      v53 = v48;
      v54 = 22;
      goto LABEL_26;
    }
LABEL_27:

    goto LABEL_28;
  }
  if ((sub_100011768(a7, a9, v22) & 1) == 0)
  {
    v57 = sub_10007CCE4(0, v24);
    v48 = objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v58 = sub_10007CD2C(0);
      v51 = objc_claimAutoreleasedReturnValue(v58);
      *(_DWORD *)buf = 138543618;
      v78 = v51;
      v79 = 2112;
      v80 = v22;
      v52 = "%{public}@### Unable to initialize characteristic '%@' because of invalid properties";
      goto LABEL_25;
    }
    goto LABEL_27;
  }
  v25 = v18;
  v73 = v25;
  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraints"));
    if (v26
      || (v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "manufacturerDescription"))) != 0
      || (v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "format"))) != 0)
    {

      v25 = v73;
      goto LABEL_10;
    }
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "units"));

    v25 = v73;
    if (v72)
      goto LABEL_10;
    v61 = sub_10007CCE4(0, v60);
    v62 = objc_claimAutoreleasedReturnValue(v61);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      v63 = sub_10007CD2C(0);
      v64 = objc_claimAutoreleasedReturnValue(v63);
      *(_DWORD *)buf = 138543362;
      v78 = v64;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "%{public}@### Characteristic metadata is empty", buf, 0xCu);

    }
    v66 = sub_10007CCE4(0, v65);
    v48 = objc_claimAutoreleasedReturnValue(v66);
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    v67 = sub_10007CD2C(0);
    v51 = objc_claimAutoreleasedReturnValue(v67);
    *(_DWORD *)buf = 138543618;
    v78 = v51;
    v79 = 2112;
    v80 = v22;
    v52 = "%{public}@### Unable to initialize characteristic '%@' because of invalid metadata";
    goto LABEL_25;
  }
LABEL_10:

  v76.receiver = self;
  v76.super_class = (Class)HAPCharacteristic;
  v27 = -[HAPCharacteristic init](&v76, "init");
  if (v27)
  {
    v70 = v18;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[HAPMetadata getSharedInstance](HAPMetadata, "getSharedInstance"));
    v29 = objc_claimAutoreleasedReturnValue(+[HMFObjectCacheNSString hmf_cachedInstanceForString:](HMFObjectCacheNSString, "hmf_cachedInstanceForString:", v22));
    type = v27->_type;
    v27->_type = (NSString *)v29;

    v71 = v28;
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "characteristicUTIFromType:", v22));
    v33 = (void *)v31;
    if (v31)
    {
      v69 = (void *)v31;
      v34 = sub_10007CCE4(0, v32);
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        v36 = sub_10007CD2C(0);
        v68 = objc_claimAutoreleasedReturnValue(v36);
        v37 = v27->_type;
        *(_DWORD *)buf = 138544130;
        v78 = v68;
        v79 = 2112;
        v80 = v37;
        v81 = 2112;
        v82 = v69;
        v83 = 2112;
        v84 = v17;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "%{public}@%@ ----> %@ [%@]", buf, 0x2Au);

      }
      v33 = v69;
    }
    objc_storeStrong((id *)&v27->_instanceID, a4);
    objc_storeStrong(&v27->_value, a5);
    objc_storeStrong((id *)&v27->_stateNumber, a6);
    v38 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    valueUpdatedTime = v27->_valueUpdatedTime;
    v27->_valueUpdatedTime = (NSDate *)v38;

    v27->_properties = a7;
    v27->_eventNotificationsEnabled = a8;
    v27->_implicitWriteWithResponse = a9;
    v27->_shouldValidateValueAfterReading = 1;
    v40 = objc_claimAutoreleasedReturnValue(+[HMFObjectCacheHAPCharacteristicMetadata hap_cacheInstanceForMetadata:](HMFObjectCacheHAPCharacteristicMetadata, "hap_cacheInstanceForMetadata:", v73));
    accessoryMetadata = v27->_accessoryMetadata;
    v27->_accessoryMetadata = (HAPCharacteristicMetadata *)v40;

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic _generateValidMetadata:](v27, "_generateValidMetadata:", v73));
    v43 = objc_claimAutoreleasedReturnValue(+[HMFObjectCacheHAPCharacteristicMetadata hap_cacheInstanceForMetadata:](HMFObjectCacheHAPCharacteristicMetadata, "hap_cacheInstanceForMetadata:", v42));
    metadata = v27->_metadata;
    v27->_metadata = (HAPCharacteristicMetadata *)v43;

    v18 = v70;
  }
  self = v27;
  v45 = self;
LABEL_29:

  return v45;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  unint64_t v12;
  _BOOL8 v13;
  unsigned __int8 v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic value](self, "value"));
  if ((objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___NSCopying) & 1) == 0)
  {

    goto LABEL_5;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic value](self, "value"));

  if (!v6)
  {
LABEL_5:
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic value](self, "value"));
    v7 = objc_msgSend(v6, "copy");
    goto LABEL_6;
  }
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
LABEL_6:
  v26 = v7;

  v23 = objc_alloc((Class)objc_opt_class(self, v8));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic type](self, "type"));
  v22 = objc_msgSend(v25, "copyWithZone:", a3);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic instanceID](self, "instanceID"));
  v9 = objc_msgSend(v24, "copyWithZone:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic stateNumber](self, "stateNumber"));
  v11 = objc_msgSend(v10, "copyWithZone:", a3);
  v12 = -[HAPCharacteristic properties](self, "properties");
  v13 = -[HAPCharacteristic eventNotificationsEnabled](self, "eventNotificationsEnabled");
  v14 = -[HAPCharacteristic isWriteWithResponseImplicitlySupported](self, "isWriteWithResponseImplicitlySupported");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic metadata](self, "metadata"));
  v16 = objc_msgSend(v15, "copyWithZone:", a3);
  LOBYTE(v21) = v14;
  v17 = objc_msgSend(v23, "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:", v22, v9, v26, v11, v12, v13, v21, v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic valueUpdatedTime](self, "valueUpdatedTime"));
  objc_msgSend(v17, "setValueUpdatedTime:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic notificationContext](self, "notificationContext"));
  objc_msgSend(v17, "setNotificationContext:", v19);

  objc_msgSend(v17, "setProhibitCaching:", -[HAPCharacteristic prohibitCaching](self, "prohibitCaching"));
  objc_msgSend(v17, "setShouldValidateValueAfterReading:", -[HAPCharacteristic shouldValidateValueAfterReading](self, "shouldValidateValueAfterReading"));

  return v17;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic instanceID](self, "instanceID"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  HAPCharacteristic *v5;
  uint64_t v6;
  HAPCharacteristic *v7;
  HAPCharacteristic *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;

  v5 = (HAPCharacteristic *)a3;
  if (self == v5)
  {
    v22 = 1;
  }
  else
  {
    v6 = objc_opt_class(HAPCharacteristic, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
      v7 = v5;
    else
      v7 = 0;
    v8 = v7;
    if (!v8)
      goto LABEL_12;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic instanceID](self, "instanceID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic instanceID](v8, "instanceID"));
    v11 = sub_10007BF54(v9, v10);

    if ((v11 & 1) != 0
      || (v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic type](self, "type")),
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic type](v8, "type")),
          v14 = sub_10007BF28((unint64_t)v12, (uint64_t)v13),
          v13,
          v12,
          (v14 & 1) != 0)
      || (v15 = -[HAPCharacteristic properties](self, "properties"),
          v15 != (id)-[HAPCharacteristic properties](v8, "properties")))
    {
LABEL_12:
      v22 = 0;
    }
    else
    {
      v16 = objc_claimAutoreleasedReturnValue(-[HAPCharacteristic service](self, "service"));
      if (v16)
      {
        v17 = (void *)v16;
        v18 = objc_claimAutoreleasedReturnValue(-[HAPCharacteristic service](v8, "service"));
        if (v18)
        {
          v19 = (void *)v18;
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic service](self, "service"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic service](v8, "service"));
          v22 = objc_msgSend(v20, "isEqual:", v21);

        }
        else
        {
          v22 = 1;
        }

      }
      else
      {
        v22 = 1;
      }
    }

  }
  return v22;
}

- (id)shortDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v3 = objc_alloc_init((Class)NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic value](self, "value"));
  objc_msgSend(v3, "appendFormat:", CFSTR("Value: %@"), v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic stateNumber](self, "stateNumber"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", State Number: %@"), v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic valueUpdatedTime](self, "valueUpdatedTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hmf_localTimeDescription"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", Value update time: %@"), v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic propertiesDescription](self, "propertiesDescription"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", Properties: %@"), v8);

  v9 = HMFBooleanToString(-[HAPCharacteristic eventNotificationsEnabled](self, "eventNotificationsEnabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v3, "appendFormat:", CFSTR(", Event Notifications Enabled: %@"), v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[HAPCharacteristic isWriteWithResponseImplicitlySupported](self, "isWriteWithResponseImplicitlySupported")));
  objc_msgSend(v3, "appendFormat:", CFSTR(", Write With Response Implicitly Supported: %@"), v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic metadata](self, "metadata"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", Metadata: %@"), v12);

  v13 = HMFBooleanToString(-[HAPCharacteristic supportsEventNotificationContext](self, "supportsEventNotificationContext"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v3, "appendFormat:", CFSTR(", supportsEventNotificationContext: %@"), v14);

  return v3;
}

- (NSString)description
{
  id v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v3 = objc_alloc_init((Class)NSMutableString);
  v13.receiver = self;
  v13.super_class = (Class)HAPCharacteristic;
  v4 = -[HAPCharacteristic description](&v13, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic service](self, "service"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uniqueIdentifier"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", Accessory Unique ID: %@"), v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic instanceID](self, "instanceID"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", Instance ID: %@"), v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic type](self, "type"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", Type: %@"), v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic shortDescription](self, "shortDescription"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", %@"), v11);

  return (NSString *)v3;
}

- (id)propertiesDescription
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  if ((-[HAPCharacteristic properties](self, "properties") & 2) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("read"));
  if ((-[HAPCharacteristic properties](self, "properties") & 4) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("write"));
  if ((-[HAPCharacteristic properties](self, "properties") & 1) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("eventConnectionNotifications"));
  if ((-[HAPCharacteristic properties](self, "properties") & 8) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("broadcast"));
  if ((-[HAPCharacteristic properties](self, "properties") & 0x10) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("additionalAuthData"));
  if ((-[HAPCharacteristic properties](self, "properties") & 0x20) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("requiresTimedWrite"));
  if ((-[HAPCharacteristic properties](self, "properties") & 0x40) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("hidden"));
  if ((-[HAPCharacteristic properties](self, "properties") & 0x80) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("writeResponse"));
  if ((-[HAPCharacteristic properties](self, "properties") & 0x100) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("eventNotificationContext"));
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init((Class)NSMutableString);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v4, "appendString:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v3, "removeObject:", v6);

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v4, "appendFormat:", CFSTR(", %@"), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v11));
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setValue:(id)a3
{
  id v4;
  NSDate *v5;
  id value;
  id v7;
  NSDate *valueUpdatedTime;

  v4 = a3;
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  value = self->_value;
  self->_value = v4;
  v7 = v4;

  valueUpdatedTime = self->_valueUpdatedTime;
  self->_valueUpdatedTime = v5;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)value
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  v4 = self->_value;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setStateNumber:(id)a3
{
  NSNumber *v4;
  NSNumber *stateNumber;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  stateNumber = self->_stateNumber;
  self->_stateNumber = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)stateNumber
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  v4 = self->_stateNumber;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setValueUpdatedTime:(id)a3
{
  NSDate *v4;
  NSDate *valueUpdatedTime;

  v4 = (NSDate *)a3;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  valueUpdatedTime = self->_valueUpdatedTime;
  self->_valueUpdatedTime = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)valueUpdatedTime
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  v4 = self->_valueUpdatedTime;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setNotificationContext:(id)a3
{
  NSData *v4;
  NSData *notificationContext;

  v4 = (NSData *)a3;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  notificationContext = self->_notificationContext;
  self->_notificationContext = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSData)notificationContext
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  v4 = self->_notificationContext;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)supportsWriteWithResponse
{
  unsigned int v3;
  _BOOL4 v4;

  v3 = -[HAPCharacteristic properties](self, "properties");
  if ((v3 & 0x80) != 0)
    LOBYTE(v4) = 1;
  else
    return -[HAPCharacteristic isWriteWithResponseImplicitlySupported](self, "isWriteWithResponseImplicitlySupported") & (v3 >> 2);
  return v4;
}

- (BOOL)supportsAdditionalAuthorizationData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  if ((-[HAPCharacteristic properties](self, "properties") & 0x10) != 0)
    return 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HAPMetadata getSharedInstance](HAPMetadata, "getSharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic service](self, "service"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic type](self, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "type"));
  v7 = objc_msgSend(v3, "supportsAdditionalAuthorizationData:forService:", v5, v6);

  return v7;
}

- (BOOL)supportsEventNotificationContext
{
  return (-[HAPCharacteristic properties](self, "properties") >> 8) & 1;
}

- (BOOL)mergeObject:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  HAPCharacteristic *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  HAPCharacteristic *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  __CFString *v26;
  void *v27;
  int v29;
  void *v30;
  __int16 v31;
  id v32;

  v4 = a3;
  v6 = objc_opt_class(HAPCharacteristic, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    v7 = v4;
  else
    v7 = 0;
  v8 = v7;
  if (!v8)
  {
LABEL_14:
    v21 = 0;
    goto LABEL_15;
  }
  if (!-[HAPCharacteristic shouldMergeObject:](self, "shouldMergeObject:", v8))
  {
    v22 = self;
    v24 = sub_10007CCE4((uint64_t)v22, v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = sub_10007CD2C(v22);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v29 = 138543618;
      v30 = v27;
      v31 = 2112;
      v32 = v8;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%{public}@Not merging with characteristic: %@", (uint8_t *)&v29, 0x16u);

    }
    goto LABEL_14;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "value"));
  -[HAPCharacteristic setValue:](self, "setValue:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristic metadata](self, "metadata"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "metadata"));
  v12 = objc_msgSend(v10, "isEqualToCharacteristicMetadata:", v11);

  if ((v12 & 1) == 0)
  {
    v13 = self;
    v15 = sub_10007CCE4((uint64_t)v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = sub_10007CD2C(v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "metadata"));
      v29 = 138543618;
      v30 = v18;
      v31 = 2112;
      v32 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%{public}@Updated the characteristic metadata: %@", (uint8_t *)&v29, 0x16u);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "metadata"));
    -[HAPCharacteristic setMetadata:](v13, "setMetadata:", v20);

  }
  v21 = v12 ^ 1;
LABEL_15:

  return v21;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)instanceID
{
  return self->_instanceID;
}

- (void)setInstanceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (HAPService)service
{
  return (HAPService *)objc_loadWeakRetained((id *)&self->_service);
}

- (void)setService:(id)a3
{
  objc_storeWeak((id *)&self->_service, a3);
}

- (unint64_t)properties
{
  return self->_properties;
}

- (void)setProperties:(unint64_t)a3
{
  self->_properties = a3;
}

- (BOOL)eventNotificationsEnabled
{
  return self->_eventNotificationsEnabled;
}

- (void)setEventNotificationsEnabled:(BOOL)a3
{
  self->_eventNotificationsEnabled = a3;
}

- (HAPCharacteristicMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)shouldValidateValueAfterReading
{
  return self->_shouldValidateValueAfterReading;
}

- (void)setShouldValidateValueAfterReading:(BOOL)a3
{
  self->_shouldValidateValueAfterReading = a3;
}

- (BOOL)prohibitCaching
{
  return self->_prohibitCaching;
}

- (void)setProhibitCaching:(BOOL)a3
{
  self->_prohibitCaching = a3;
}

- (HAPCharacteristicMetadata)accessoryMetadata
{
  return self->_accessoryMetadata;
}

- (BOOL)isWriteWithResponseImplicitlySupported
{
  return self->_implicitWriteWithResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryMetadata, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_notificationContext, 0);
  objc_storeStrong((id *)&self->_stateNumber, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_valueUpdatedTime, 0);
}

@end
