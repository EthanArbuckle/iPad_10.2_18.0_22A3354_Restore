@implementation NavigationSettingsController

+ (id)navigationDestinationTitle
{
  return CFSTR("Navigation");
}

- (void)prepareContent
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1007C7A68;
  v10[3] = &unk_1011AEAC8;
  objc_copyWeak(&v11, &location);
  v3 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Settings"), v10);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1007C8270;
  v8[3] = &unk_1011AEAC8;
  objc_copyWeak(&v9, &location);
  v4 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Features"), v8);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1007C8624;
  v6[3] = &unk_1011AEAC8;
  objc_copyWeak(&v7, &location);
  v5 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Debugging"), v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_addNavigationRowWithTitle:(id)a3 section:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1007C8800;
  v10[3] = &unk_1011C7390;
  v11 = a3;
  v12 = a5;
  v7 = v12;
  v8 = v11;
  v9 = objc_msgSend(a4, "addNavigationRowWithTitle:viewControllerContent:", v8, v10);

}

- (void)_addVisualizationSettings:(id)a3
{
  id v3;
  id v4;
  id v5;

  v5 = a3;
  v3 = objc_msgSend(v5, "addSectionWithTitle:content:", 0, &stru_1011C73B0);
  v4 = objc_msgSend(v5, "addSectionWithTitle:content:", CFSTR("Arrival Regions"), &stru_1011C73D0);

}

- (void)_addLocationsSettings:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;

  v6 = a3;
  v3 = objc_msgSend(v6, "addSectionWithTitle:content:", 0, &stru_1011C73F0);
  v4 = objc_msgSend(v6, "addSectionWithTitle:content:", CFSTR("Location Projection"), &stru_1011C7410);
  v5 = objc_msgSend(v6, "addSectionWithTitle:content:", CFSTR("Probe Crumbs"), &stru_1011C7470);

}

- (void)_addRoutingSettings:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_1007C90C8;
  v13 = &unk_1011AEAC8;
  objc_copyWeak(&v14, &location);
  v5 = objc_msgSend(v4, "addSectionWithTitle:content:", 0, &v10);
  v6 = objc_msgSend(v4, "addSectionWithTitle:content:", CFSTR("Arrival"), &stru_1011C7510, v10, v11, v12, v13);
  v7 = objc_msgSend(v4, "addSectionWithTitle:content:", CFSTR("Departure From Waypoint"), &stru_1011C7530);
  v8 = objc_msgSend(v4, "addSectionWithTitle:content:", CFSTR("Logging"), &stru_1011C7610);
  v9 = objc_msgSend(v4, "addSectionWithTitle:content:", 0, &stru_1011C7630);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)_addTrafficOverrideSettings:(id)a3
{
  id v3;
  id v4;
  id v5;

  v5 = a3;
  v3 = objc_msgSend(v5, "addSectionWithTitle:content:", CFSTR("Override Color"), &stru_1011C7650);
  v4 = objc_msgSend(v5, "addSectionWithTitle:content:", CFSTR("Override Section"), &stru_1011C7690);

}

- (void)_addETAUpdatesSettings:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "addSectionWithTitle:content:", 0, &stru_1011C76D0);
}

- (void)_addAudioSettings:(id)a3
{
  id v3;
  id v4;
  id v5;

  v5 = a3;
  v3 = objc_msgSend(v5, "addSectionWithTitle:content:", 0, &stru_1011C7A50);
  v4 = objc_msgSend(v5, "addSectionWithTitle:content:", CFSTR("Server Side Instructions"), &stru_1011C7AB0);

}

- (void)_addTransitSettings:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "addSectionWithTitle:content:", 0, &stru_1011C7AD0);
}

- (void)_addCustomRoutesSettings:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v5 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addSectionWithTitle:content:", 0, &stru_1011C7AF0));
  objc_msgSend(v3, "setFooter:", CFSTR("Enables navigation on a custom route as long as location is near the route, even if current location is not near the origin."));

  v4 = objc_msgSend(v5, "addSectionWithTitle:content:", 0, &stru_1011C7B10);
}

- (void)_addTimeToLeaveSettings:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "addSectionWithTitle:content:", 0, &stru_1011C7B50);
}

- (void)_addNavigationServiceSettings:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "addSectionWithTitle:content:", 0, &stru_1011C7B70);
}

- (void)_addPreloadingSettings:(id)a3
{
  id v3;
  id v4;
  id v5;

  v5 = a3;
  v3 = objc_msgSend(v5, "addSectionWithTitle:content:", 0, &stru_1011C7C10);
  v4 = objc_msgSend(v5, "addSectionWithTitle:content:", 0, &stru_1011C7C30);

}

- (void)_addThermalMitigationsSettings:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  _BYTE v23[128];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1007CB678;
  v21[3] = &unk_1011B01E8;
  v3 = a3;
  v22 = v3;
  v4 = objc_retainBlock(v21);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThermalPressureController mitigations](MapsThermalPressureController, "mitigations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sortedArrayUsingSelector:", "compare:"));

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("NavigationDisableLockScreen")))
        {
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_1007CB814;
          v16[3] = &unk_1011B4BC0;
          v16[4] = v13;
          v14 = objc_msgSend(v3, "addSectionWithTitle:content:", v13, v16);
        }
        else
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v13));
          ((void (*)(_QWORD *, void *, void *))v4[2])(v4, v15, v13);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v10);
  }

}

- (void)_addVisualFeaturesSettings:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id from;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1007CBB68;
  v20[3] = &unk_1011C3F08;
  objc_copyWeak(&v21, &from);
  objc_copyWeak(&v22, &location);
  v5 = objc_msgSend(v4, "addSectionWithTitle:content:", CFSTR("General"), v20);
  if (sub_1008315F4())
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1007CC5C0;
    v18[3] = &unk_1011AEAC8;
    objc_copyWeak(&v19, &from);
    v6 = objc_msgSend(v4, "addSectionWithTitle:content:", CFSTR("Pedestrian AR"), v18);
    objc_destroyWeak(&v19);
  }
  if (sub_1003A5954())
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1007CE2EC;
    v15[3] = &unk_1011C3F08;
    objc_copyWeak(&v16, &location);
    objc_copyWeak(&v17, &from);
    v7 = objc_msgSend(v4, "addSectionWithTitle:content:", CFSTR("VLF"), v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v16);
  }
  if ((sub_1003A5954() || sub_1008315F4()) && MapsFeature_IsAvailable_VisualLocalizationCrowdsourcing())
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1007D08FC;
    v12[3] = &unk_1011C3F08;
    objc_copyWeak(&v13, &location);
    objc_copyWeak(&v14, &from);
    v8 = objc_msgSend(v4, "addSectionWithTitle:content:", CFSTR("VLF Crowdsourcing"), v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);
  }
  if (qword_1014D56D0 != -1)
    dispatch_once(&qword_1014D56D0, &stru_1011BE940);
  if ((byte_1014D56C8 & 1) == 0)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1007D0BE8;
    v10[3] = &unk_1011AEAC8;
    objc_copyWeak(&v11, &from);
    v9 = objc_msgSend(v4, "addSectionWithTitle:content:", CFSTR("MarcoLite"), v10);
    objc_destroyWeak(&v11);
  }
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (void)_addRoutePlanningRefreshingSettings:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "addSectionWithTitle:content:", 0, &stru_1011C86B8);
}

- (void)_addEVRoutingSettings:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "addSectionWithTitle:content:", CFSTR("EV Routing"), &stru_1011C86D8);
}

- (void)_addLicensePlateRestrictionsSettings:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "addSectionWithTitle:content:", CFSTR("LPR"), &stru_1011C8918);
}

- (void)_addManeuverArrowSettings:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "addSectionWithTitle:content:", CFSTR("Maneuver Arrows"), &stru_1011C8958);
}

- (void)_addParkingNavigationSettings:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_msgSend(v4, "addSectionWithTitle:content:", 0, &stru_1011C8978);
  v6 = objc_msgSend(v4, "addSectionWithTitle:content:", CFSTR("Background Walking Route Thresholds"), &stru_1011C8998);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1007D2DA4;
  v8[3] = &unk_1011AEAC8;
  objc_copyWeak(&v9, &location);
  v7 = objc_msgSend(v4, "addSectionWithTitle:content:", 0, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)_addTracesAndSimulationSettings:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;

  v6 = a3;
  v3 = objc_msgSend(v6, "addSectionWithTitle:content:", CFSTR("Trace Playback"), &stru_1011C89D8);
  v4 = objc_msgSend(v6, "addSectionWithTitle:content:", CFSTR("Trace Recording"), &stru_1011C8A98);
  v5 = objc_msgSend(v6, "addSectionWithTitle:content:", CFSTR("Simulation"), &stru_1011C8AB8);

}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void **v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", UIImagePickerControllerPHAsset));
  if (v7)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2050000000;
    v8 = (void *)qword_1014D33E0;
    v22 = qword_1014D33E0;
    if (!qword_1014D33E0)
    {
      v14 = _NSConcreteStackBlock;
      v15 = 3221225472;
      v16 = sub_1007D446C;
      v17 = &unk_1011AFF60;
      v18 = &v19;
      sub_1007D446C((uint64_t)&v14);
      v8 = (void *)v20[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v19, 8);
    v10 = objc_alloc_init(v9);
    objc_msgSend(v10, "setVersion:", 1);
    v19 = 0;
    v20 = &v19;
    v21 = 0x2050000000;
    v11 = (void *)qword_1014D33E8;
    v22 = qword_1014D33E8;
    if (!qword_1014D33E8)
    {
      v14 = _NSConcreteStackBlock;
      v15 = 3221225472;
      v16 = sub_1007D4594;
      v17 = &unk_1011AFF60;
      v18 = &v19;
      sub_1007D4594((uint64_t)&v14);
      v11 = (void *)v20[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v19, 8);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "defaultManager"));
    objc_msgSend(v13, "requestAVAssetForVideo:options:resultHandler:", v7, v10, &stru_1011C8AF8);

  }
  else
  {
    _GEOConfigRemoveValue(MapsConfig_MapsARSessionPlaybackFilePathKey, off_1014B55D8);
  }
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)imagePickerControllerDidCancel:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = MapsConfig_MapsARSessionPlaybackFilePathKey;
  v4 = off_1014B55D8;
  v5 = a3;
  _GEOConfigRemoveValue(v3, v4);
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

@end
