@implementation VMDSPGraph

+ (id)nsImplementation
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("NS Implementation")));

  if (v3)
    v4 = v3;
  else
    v4 = CFSTR("ons4");
  v5 = v4;

  return v5;
}

+ (id)_reverbSuppressionParameters
{
  double v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  LODWORD(v2) = -24.0;
  LODWORD(v4) = 0;
  LODWORD(v3) = -1035468800;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[VMAudioParameter parameterWithName:defaultValue:min:max:internalAddress:graphName:](VMAudioParameter, "parameterWithName:defaultValue:min:max:internalAddress:graphName:", CFSTR("RS Pass One Gain Floor"), 0, CFSTR("ReverbSuppressor"), v2, v3, v4));
  LODWORD(v6) = -12.0;
  LODWORD(v7) = 0;
  LODWORD(v8) = -1035468800;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[VMAudioParameter parameterWithName:defaultValue:min:max:internalAddress:graphName:](VMAudioParameter, "parameterWithName:defaultValue:min:max:internalAddress:graphName:", CFSTR("RS Pass Two Gain Floor"), 1, CFSTR("ReverbSuppressor"), v6, v8, v7, v5));
  v16[1] = v9;
  LODWORD(v10) = 8.0;
  LODWORD(v11) = -30.0;
  LODWORD(v12) = 30.0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[VMAudioParameter parameterWithName:defaultValue:min:max:internalAddress:graphName:](VMAudioParameter, "parameterWithName:defaultValue:min:max:internalAddress:graphName:", CFSTR("RS SPL Reverb Tail Gain"), 2, CFSTR("ReverbSuppressor"), v10, v11, v12));
  v16[2] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 3));

  return v14;
}

+ (id)_noiseSuppressionParameters
{
  double v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  _QWORD v20[4];

  LODWORD(v2) = -12.0;
  LODWORD(v3) = -24.0;
  LODWORD(v4) = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[VMAudioParameter parameterWithName:defaultValue:min:max:internalAddress:graphName:](VMAudioParameter, "parameterWithName:defaultValue:min:max:internalAddress:graphName:", CFSTR("NS Suppression Level"), 0, CFSTR("NoiseSuppressor"), v2, v3, v4));
  v20[0] = v5;
  LODWORD(v6) = 0;
  LODWORD(v7) = -20.0;
  LODWORD(v8) = 20.0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[VMAudioParameter parameterWithName:defaultValue:min:max:internalAddress:graphName:](VMAudioParameter, "parameterWithName:defaultValue:min:max:internalAddress:graphName:", CFSTR("NS AGC Post Gain"), 4, CFSTR("NoiseSuppressor"), v6, v7, v8));
  v20[1] = v9;
  LODWORD(v10) = 1117782016;
  LODWORD(v11) = 1120403456;
  LODWORD(v12) = -25.0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[VMAudioParameter parameterWithName:defaultValue:min:max:internalAddress:graphName:](VMAudioParameter, "parameterWithName:defaultValue:min:max:internalAddress:graphName:", CFSTR("NS SPL Meter Calibration"), 6, CFSTR("NoiseSuppressor"), v10, v12, v11));
  v20[2] = v13;
  LODWORD(v14) = 5.0;
  LODWORD(v15) = 0;
  LODWORD(v16) = 10.0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[VMAudioParameter parameterWithName:defaultValue:min:max:internalAddress:graphName:](VMAudioParameter, "parameterWithName:defaultValue:min:max:internalAddress:graphName:", CFSTR("NS SPL Time Constant"), 7, CFSTR("NoiseSuppressor"), v14, v15, v16));
  v20[3] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 4));

  return v18;
}

+ (id)parameters
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001EF00;
  block[3] = &unk_1001AB4D8;
  block[4] = a1;
  if (qword_1001ED7B8 != -1)
    dispatch_once(&qword_1001ED7B8, block);
  return (id)qword_1001ED7B0;
}

+ (BOOL)writeGraphTextToFile:(id)a3 samplerate:(int)a4 bufferSize:(int)a5 error:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  id v25;
  float v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];

  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = v10;
  if (!qword_1001ED7C0)
  {
    v41 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pathForResource:ofType:", CFSTR("voiceMemo_NS_ReverbSuppressor_template"), CFSTR("dspg")));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithContentsOfFile:encoding:error:](NSMutableString, "stringWithContentsOfFile:encoding:error:", v13, 4, a6));
    v15 = objc_msgSend(v14, "rangeOfString:", CFSTR("noise_supression_imp_token"));
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "nsImplementation"));
    objc_msgSend(v14, "replaceCharactersInRange:withString:", v15, v17, v18);

    if (!v14)
    {

      v35 = 0;
      v11 = v41;
      goto LABEL_12;
    }
    v37 = v13;
    v38 = v8;
    v39 = v7;
    v40 = a6;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "parameters"));
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v43 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
          v25 = objc_msgSend(v24, "address");
          objc_msgSend(v24, "defaultValue");
          objc_msgSend(v14, "appendFormat:", CFSTR("param %i %f in\n"), v25, v26);
          v27 = objc_msgSend(v24, "address");
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "graphName"));
          objc_msgSend(v14, "appendFormat:", CFSTR("wireGraphParam %i (%@ %i 0 0)\n"), v27, v28, objc_msgSend(v24, "internalAddress"));

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v21);
    }

    v29 = objc_msgSend(v14, "copy");
    v30 = (void *)qword_1001ED7C0;
    qword_1001ED7C0 = (uint64_t)v29;

    a6 = v40;
    v11 = v41;
    v8 = v38;
    v7 = v39;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[def fs %i]"), v8));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[def sz %i]"), v7));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001ED7C0, "stringByReplacingOccurrencesOfString:withString:", CFSTR("samplerate_def_token"), v31));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "stringByReplacingOccurrencesOfString:withString:", CFSTR("size_def_token"), v32));

  v35 = objc_msgSend(v34, "writeToFile:atomically:encoding:error:", v11, 1, 4, a6);
LABEL_12:

  return v35;
}

+ (id)propertyStrip
{
  if (qword_1001ED7D0 != -1)
    dispatch_once(&qword_1001ED7D0, &stru_1001AB518);
  return (id)qword_1001ED7C8;
}

+ (id)auStrip
{
  if (qword_1001ED7E0 != -1)
    dispatch_once(&qword_1001ED7E0, &stru_1001AB538);
  return (id)qword_1001ED7D8;
}

@end
