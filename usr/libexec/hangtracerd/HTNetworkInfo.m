@implementation HTNetworkInfo

+ (id)networkStateForTailSpin
{
  uint64_t evaluator_for_endpoint;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  const __CFString *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t interface_time_delta;
  void *v12;
  id v13;
  NSObject *v14;
  uint8_t v16[8];
  const __CFString *v17;
  NSObject *v18;

  evaluator_for_endpoint = nw_path_create_evaluator_for_endpoint(0, 0);
  v3 = (void *)evaluator_for_endpoint;
  if (evaluator_for_endpoint)
  {
    v4 = nw_path_evaluator_copy_path(evaluator_for_endpoint);
    v5 = v4;
    if (!v4)
    {
      v10 = sub_100024FF4();
      v6 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No path for network state", v16, 2u);
      }
      v9 = 0;
      goto LABEL_20;
    }
    if (nw_path_get_status(v4) == nw_path_status_satisfied)
    {
      v6 = objc_alloc_init((Class)NSMutableDictionary);
      if (nw_path_uses_interface_type(v5, nw_interface_type_wifi))
      {
        v7 = CFSTR("Wi-Fi");
      }
      else if (nw_path_uses_interface_type(v5, nw_interface_type_cellular))
      {
        v7 = CFSTR("Cell");
      }
      else if (nw_path_uses_interface_type(v5, nw_interface_type_wired))
      {
        v7 = CFSTR("Wired");
      }
      else
      {
        v7 = CFSTR("Other");
      }
      -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v7, CFSTR("Primary"));
      interface_time_delta = nw_path_get_interface_time_delta(v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", interface_time_delta));
      -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v12, CFSTR("SecondsSincePrimary"));

      v13 = sub_100024FF4();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        sub_10002DFA8(v6, interface_time_delta, v14);

      v17 = CFSTR("NetworkState");
      v18 = v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
LABEL_20:

      goto LABEL_21;
    }
  }
  else
  {
    v8 = sub_100024FF4();
    v5 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No evaluator for network state", v16, 2u);
    }
  }
  v9 = 0;
LABEL_21:

  return v9;
}

@end
