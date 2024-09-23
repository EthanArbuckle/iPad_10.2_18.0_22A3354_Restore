@implementation MCNewWebClipPayloadHandler

- (id)savedWebClipIdentifier
{
  void *v2;
  void *v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  os_log_t v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "savedIdentifier"));
  if (!v3)
  {
    v4 = objc_msgSend(v2, "fullScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUID"));
    v3 = v5;
    if (v4)
    {
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_1000E4AA0));

      v3 = (void *)v6;
    }
    v7 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "friendlyName"));
      v11 = 138543618;
      v12 = v9;
      v13 = 2114;
      v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "WebClipHandler missing saved ID for payload '%{public}@'. Falling back to identifier: %{public}@", (uint8_t *)&v11, 0x16u);

    }
  }

  return v3;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  os_log_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  BOOL v34;
  os_log_t v35;
  NSObject *v36;
  void *v37;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kMCInstallProfileOptionIsInstalledByMDM));

  v11 = objc_msgSend(v10, "BOOLValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString MCMakeUUID](NSString, "MCMakeUUID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_1000E4AA0));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIWebClip webClipWithIdentifier:](UIWebClip, "webClipWithIdentifier:", v13));
  objc_msgSend(v14, "setFullScreen:", objc_msgSend(v9, "fullScreen"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URL"));
  objc_msgSend(v14, "setPageURL:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "label"));
  objc_msgSend(v14, "setTitle:", v16);

  objc_msgSend(v14, "setRemovalDisallowed:", objc_msgSend(v9, "isRemovable") ^ 1);
  if ((objc_opt_respondsToSelector(v14, "setConfigurationIsManaged:") & 1) != 0)
    objc_msgSend(v14, "setConfigurationIsManaged:", 1);
  if ((objc_opt_respondsToSelector(v14, "setIgnoreManifestScope:") & 1) != 0)
    objc_msgSend(v14, "setIgnoreManifestScope:", objc_msgSend(v9, "ignoreManifestScope"));
  if ((objc_opt_respondsToSelector(v14, "setContentModeWithString:") & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentMode"));
    objc_msgSend(v14, "setContentModeWithString:", v17);

  }
  if (v11)
  {
    if ((objc_opt_respondsToSelector(v14, "setApplicationBundleIdentifier:") & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "targetApplicationBundleIdentifier"));
      objc_msgSend(v14, "setApplicationBundleIdentifier:", v18);

    }
  }
  else
  {
    v19 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "WebClipHandler ignoring target application identifier because the profile is not being installed by MDM", buf, 2u);
    }
    objc_msgSend(v9, "setTargetApplicationBundleIdentifier:", 0);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "iconData"));

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "iconData"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](UIImage, "imageWithData:", v21));
    objc_msgSend(v14, "setIconImage:isPrecomposed:", v22, objc_msgSend(v9, "precomposed"));

  }
  if (-[MCNewWebClipPayloadHandler _addWebClip:](self, "_addWebClip:", v14))
  {
    objc_msgSend(v9, "setSavedIdentifier:", v13);

LABEL_23:
    v35 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v36 = v35;
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "friendlyName"));
      *(_DWORD *)buf = 138543362;
      v40 = v37;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "WebClipHandler successfully installed web clip for payload '%{public}@'", buf, 0xCu);

    }
    v34 = 1;
    goto LABEL_26;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewWebClipPayloadHandler _webclipFailedToCreateOnDiskError](self, "_webclipFailedToCreateOnDiskError"));

  if (!v23)
    goto LABEL_23;
  v24 = MCInstallationErrorDomain;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "friendlyName"));
  v27 = MCErrorArray(CFSTR("ERROR_PAYLOAD_FAILED_P_ID"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v24, 4001, v28, v23, MCErrorTypeFatal, v26, 0));

  if (a6)
    *a6 = objc_retainAutorelease(v29);
  v30 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v31 = v30;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "friendlyName"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "MCVerboseDescription"));
    *(_DWORD *)buf = 138543618;
    v40 = v32;
    v41 = 2114;
    v42 = v33;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "WebClipHandler cannot install webclip for payload '%{public}@' with error: %{public}@", buf, 0x16u);

  }
  v34 = 0;
LABEL_26:

  return v34;
}

- (id)_findInstalledClipWithIdentifier:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIWebClip webClips](UIWebClip, "webClips"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier", (_QWORD)v12));
        v10 = objc_msgSend(v9, "isEqualToString:", v3);

        if ((v10 & 1) != 0)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)_installedWebClip
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewWebClipPayloadHandler savedWebClipIdentifier](self, "savedWebClipIdentifier"));
  v4 = objc_claimAutoreleasedReturnValue(-[MCNewWebClipPayloadHandler _findInstalledClipWithIdentifier:](self, "_findInstalledClipWithIdentifier:", v3));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "WebClipHandler found webclip for saved ID: %{public}@", (uint8_t *)&v14, 0xCu);
    }
    v7 = v5;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUID"));

    v7 = (id)objc_claimAutoreleasedReturnValue(-[MCNewWebClipPayloadHandler _findInstalledClipWithIdentifier:](self, "_findInstalledClipWithIdentifier:", v9));
    v10 = _MCLogObjects[0];
    v11 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v11)
      {
        v14 = 138543362;
        v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "WebClipHandler found webclip for payload UUID: %{public}@", (uint8_t *)&v14, 0xCu);
      }
      v12 = v7;
    }
    else if (v11)
    {
      v14 = 138543618;
      v15 = v3;
      v16 = 2114;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "WebClipHandler could not find webclip for saved ID '%{public}@' or payload UUID '%{public}@'", (uint8_t *)&v14, 0x16u);
    }

  }
  return v7;
}

- (void)remove
{
  void *v3;
  unsigned int v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v4 = objc_msgSend(v3, "isSetAside");

  if (v4)
  {
    v5 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "WebClipHandler ignoring remove because profile is set aside.", buf, 2u);
    }
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewWebClipPayloadHandler _installedWebClip](self, "_installedWebClip"));
    if (v6)
    {
      -[MCNewWebClipPayloadHandler _removeWebClip:](self, "_removeWebClip:", v6);
    }
    else
    {
      v7 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "WebClipHandler ignoring remove because webclip is not installed.", v8, 2u);
      }
    }

  }
}

- (BOOL)isInstalled
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewWebClipPayloadHandler _installedWebClip](self, "_installedWebClip"));
  v3 = v2 != 0;

  return v3;
}

- (void)setAside
{
  UIWebClip *v3;
  UIWebClip *setAsideClip;
  NSObject *v5;
  uint8_t v6[16];

  v3 = (UIWebClip *)objc_claimAutoreleasedReturnValue(-[MCNewWebClipPayloadHandler _installedWebClip](self, "_installedWebClip"));
  setAsideClip = self->_setAsideClip;
  self->_setAsideClip = v3;

  if (self->_setAsideClip)
  {
    -[MCNewWebClipPayloadHandler _removeWebClip:](self, "_removeWebClip:");
  }
  else
  {
    v5 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "WebClipHandler ignoring set aside because webclip is not installed.", v6, 2u);
    }
  }
}

- (void)unsetAside
{
  UIWebClip *setAsideClip;
  void *v4;
  UIWebClip *v5;
  NSObject *v6;
  uint8_t v7[16];

  setAsideClip = self->_setAsideClip;
  if (setAsideClip
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIWebClip identifier](setAsideClip, "identifier")),
        v4,
        v4))
  {
    if (-[MCNewWebClipPayloadHandler _addWebClip:](self, "_addWebClip:", self->_setAsideClip))
    {
      v5 = self->_setAsideClip;
      self->_setAsideClip = 0;

    }
  }
  else
  {
    v6 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "WebClipHandler ignoring unset aside because webclip is not set aside.", v7, 2u);
    }
  }
}

- (id)_webclipFailedToCreateOnDiskError
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = MCWebClipErrorDomain;
  v3 = MCErrorArray(CFSTR("WEBCLIP_PAYLOAD_CANNOT_INSTALL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 8000, v4, MCErrorTypeFatal, 0));

  return v5;
}

- (BOOL)_addWebClip:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  id v7;
  os_log_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  os_log_t v12;
  int v14;
  id v15;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  v5 = objc_msgSend(v3, "createOnDisk");

  if (v5)
  {
    v6 = MCSBSSpringBoardServerPort();
    v7 = objc_retainAutorelease(v4);
    MCSBAddWebClipToHomeScreen(v6, objc_msgSend(v7, "UTF8String"));
    v8 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = v7;
      v9 = "WebClipHandler added webclip with identifier: %{public}@";
      v10 = v8;
      v11 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v14 = 138543362;
      v15 = v4;
      v9 = "WebClipHandler failed to create webclip on disk with identifier: %{public}@";
      v10 = v12;
      v11 = OS_LOG_TYPE_ERROR;
      goto LABEL_6;
    }
  }

  return v5;
}

- (void)_removeWebClip:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  os_log_t v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  int v11;
  id v12;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  v5 = MCSBSSpringBoardServerPort();
  v6 = objc_retainAutorelease(v4);
  MCSBRemoveWebClipFromHomeScreen(v5, objc_msgSend(v6, "UTF8String"));
  LODWORD(v5) = objc_msgSend(v3, "removeFromDisk");

  v7 = _MCLogObjects[0];
  if ((_DWORD)v5)
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v6;
      v8 = "WebClipHandler removed webclip with identifier: %{public}@";
      v9 = v7;
      v10 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, (uint8_t *)&v11, 0xCu);
    }
  }
  else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v11 = 138543362;
    v12 = v6;
    v8 = "WebClipHandler failed to remove webclip from disk with identifier: %{public}@";
    v9 = v7;
    v10 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setAsideClip, 0);
}

@end
