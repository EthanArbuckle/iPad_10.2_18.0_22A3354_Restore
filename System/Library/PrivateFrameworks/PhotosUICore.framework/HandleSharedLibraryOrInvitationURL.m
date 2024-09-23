@implementation HandleSharedLibraryOrInvitationURL

uint64_t ___HandleSharedLibraryOrInvitationURL_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

void ___HandleSharedLibraryOrInvitationURL_block_invoke_455(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  PLSharedLibraryGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "Canceled by the user: Handle URL", v5, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    PXSharedLibraryUserCanceledErrorWithDebugDescription(CFSTR("Handle URL"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

  }
}

void ___HandleSharedLibraryOrInvitationURL_block_invoke_460(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
    v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = ___HandleSharedLibraryOrInvitationURL_block_invoke_2;
    v9[3] = &unk_1E5117B68;
    v10 = v5;
    v11 = *(id *)(a1 + 40);
    v12 = *(id *)(a1 + 48);
    v13 = *(id *)(a1 + 56);
    v14 = *(id *)(a1 + 64);
    v15 = *(id *)(a1 + 32);
    v18 = *(id *)(a1 + 80);
    v16 = *(id *)(a1 + 72);
    v17 = v6;
    PXSharedLibraryDismissProgressAlertWithPresentationEnvironment(v7, v8, v9);

  }
}

void ___HandleSharedLibraryOrInvitationURL_block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  char v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  const __CFString *v41;
  int v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  NSObject *v48;
  os_log_type_t v49;
  uint32_t v50;
  const __CFString *v51;
  __CFString *v52;
  id v53;
  id v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  char v68;
  id v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  _QWORD v83[4];
  id v84;
  id v85;
  id v86;
  id v87;
  _QWORD v88[4];
  id v89;
  id v90;
  _QWORD v91[4];
  _BYTE *v92;
  _BYTE buf[24];
  void *v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    PLSharedLibraryGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v3 = *(_QWORD *)(a1 + 40);
      v5 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v3;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v4;
      *(_WORD *)&buf[22] = 2112;
      v94 = v5;
      _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Did fetch Shared Library: %@ for URL: %@", buf, 0x20u);
    }

    v6 = *(void **)(a1 + 64);
    v7 = *(void **)(a1 + 72);
    v8 = *(void **)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    v10 = *(void **)(a1 + 96);
    v11 = *(id *)(a1 + 56);
    v12 = v8;
    v13 = v6;
    v14 = v7;
    v15 = v9;
    v82 = v10;
    dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
    if (v12)
    {
      if (v14)
      {
LABEL_6:
        if (!objc_msgSend(v15, "length"))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _HandleFetchedSharedLibraryInvitation(PXSharedLibraryStatusProvider *__strong, __strong id<PXSharedLibrary>, PXSharedLibraryLegacyDevicesFallbackMonitor * _Nullable __strong, __strong id<PXPresentationEnvironment>, NSString *__strong, void (^ _Nullable __strong)(BOOL, NSError * _Nullable __strong))");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "handleFailureInFunction:file:lineNumber:description:", v80, CFSTR("PXSharedLibraryUtilities.m"), 1430, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("senderIdentifier.length"));

        }
        v16 = v11;
        v17 = v15;
        PLSharedLibraryGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v17;
          _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Will perform preconditions check for presenting Shared Library invitation", buf, 0xCu);
        }

        +[PXSharedLibrarySettings sharedInstance](PXSharedLibrarySettings, "sharedInstance");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "fetchExiting");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = objc_msgSend(v19, "simulateErrorType");
        v22 = v21;
        if (v20 || v21 == 14)
        {
          PLSharedLibraryGetLog();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            v41 = &stru_1E5149688;
            if (v22 == 14)
              v41 = CFSTR("(Simulated)");
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v17;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v41;
            _os_log_impl(&dword_1A6789000, v40, OS_LOG_TYPE_ERROR, "%{public}@: Failed preconditions check for presenting Shared Library invitation: Shared Library Exiting %{public}@", buf, 0x16u);
          }

          PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_InvitationAlertTitle_IsExiting"));
          v32 = (id)objc_claimAutoreleasedReturnValue();
          PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_InvitationAlertMessage_IsExiting"));
          v33 = (id)objc_claimAutoreleasedReturnValue();
          v29 = 0;
        }
        else
        {
          v81 = v12;
          v23 = v14;
          v24 = v13;
          objc_msgSend(v16, "fetchSharedLibrary");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v19, "simulateErrorType");
          v27 = v26;
          if (v25)
            v28 = 1;
          else
            v28 = v26 == 15;
          v29 = !v28;
          PLSharedLibraryGetLog();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = v30;
          if ((v29 & 1) != 0)
          {
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v17;
              _os_log_impl(&dword_1A6789000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully passed preconditions check for presenting Shared Library invitation", buf, 0xCu);
            }
            v32 = 0;
            v33 = 0;
          }
          else
          {
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              v51 = CFSTR("(Simulated)");
              if (v27 != 15)
                v51 = &stru_1E5149688;
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v17;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v51;
              _os_log_impl(&dword_1A6789000, v31, OS_LOG_TYPE_ERROR, "%{public}@: Failed preconditions check for presenting Shared Library invitation: Participates in Shared Library %{public}@", buf, 0x16u);
            }

            PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_InvitationAlertTitle_HasSharedLibrary_iOS"));
            v32 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "owner");
            v31 = objc_claimAutoreleasedReturnValue();
            if (-[NSObject isCurrentUser](v31, "isCurrentUser"))
              v52 = CFSTR("PXSharedLibrary_Owner_InvitationAlertMessage_HasSharedLibrary");
            else
              v52 = CFSTR("PXSharedLibrary_Participant_InvitationAlertMessage_HasSharedLibrary");
            PXLocalizedSharedLibraryString(v52);
            v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());

          }
          v13 = v24;
          v14 = v23;
          v12 = v81;
        }

        v53 = v32;
        v54 = v33;
        if ((v29 & 1) != 0)
        {
          v55 = v82;
          if (objc_msgSend(v12, "isDeclined"))
          {
            PLSharedLibraryGetLog();
            v56 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v17;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v12;
              _os_log_impl(&dword_1A6789000, v56, OS_LOG_TYPE_DEFAULT, "%{public}@: Will confirm restore of declined Shared Library invitation: %@", buf, 0x16u);
            }

            v57 = MEMORY[0x1E0C809B0];
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = ___HandleFetchedSharedLibraryInvitation_block_invoke_482;
            v94 = &unk_1E5117BE0;
            v95 = v17;
            v96 = v12;
            v97 = v16;
            v98 = v13;
            v58 = v14;
            v99 = v58;
            v100 = v82;
            v91[0] = v57;
            v91[1] = 3221225472;
            v91[2] = ___ConfirmRestoringInvitation_block_invoke;
            v91[3] = &unk_1E5121CE8;
            v92 = buf;
            v59 = (id)objc_msgSend(v58, "presentAlertWithConfigurationHandler:", v91);

          }
          else
          {
            _ViewInvitation(v16, v12, v13, v14, v17, v82);
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, 0, CFSTR("%@"), v53);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = ___HandleFetchedSharedLibraryInvitation_block_invoke;
          v94 = &unk_1E5148CE0;
          v55 = v82;
          v61 = v82;
          v95 = v60;
          v96 = v61;
          v62 = v60;
          PXPresentFailureWithLocalizedTitle(v53, v54, 0, v62, v14, buf);

        }
        return;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _HandleFetchedSharedLibraryInvitation(PXSharedLibraryStatusProvider *__strong, __strong id<PXSharedLibrary>, PXSharedLibraryLegacyDevicesFallbackMonitor * _Nullable __strong, __strong id<PXPresentationEnvironment>, NSString *__strong, void (^ _Nullable __strong)(BOOL, NSError * _Nullable __strong))");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "handleFailureInFunction:file:lineNumber:description:", v76, CFSTR("PXSharedLibraryUtilities.m"), 1428, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invitation"));

      if (v14)
        goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _HandleFetchedSharedLibraryInvitation(PXSharedLibraryStatusProvider *__strong, __strong id<PXSharedLibrary>, PXSharedLibraryLegacyDevicesFallbackMonitor * _Nullable __strong, __strong id<PXPresentationEnvironment>, NSString *__strong, void (^ _Nullable __strong)(BOOL, NSError * _Nullable __strong))");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "handleFailureInFunction:file:lineNumber:description:", v78, CFSTR("PXSharedLibraryUtilities.m"), 1429, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentationEnvironment"));

    goto LABEL_6;
  }
  if (objc_msgSend(*(id *)(a1 + 80), "isFailedToURLFetchOwnedSharedLibraryError:", *(_QWORD *)(a1 + 88)))
  {
    PLSharedLibraryGetLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v36 = *(_QWORD *)(a1 + 32);
      v35 = *(_QWORD *)(a1 + 40);
      v37 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v35;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v36;
      *(_WORD *)&buf[22] = 2112;
      v94 = v37;
      _os_log_impl(&dword_1A6789000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to URL fetch owned Shared Library: %@ for URL: %@", buf, 0x20u);
    }

    PLSharedLibraryGetLog();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v39;
      _os_log_impl(&dword_1A6789000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@: Will navigate to Shared Library preferences", buf, 0xCu);
    }

    v88[0] = MEMORY[0x1E0C809B0];
    v88[1] = 3221225472;
    v88[2] = ___HandleSharedLibraryOrInvitationURL_block_invoke_462;
    v88[3] = &unk_1E5148348;
    v89 = *(id *)(a1 + 40);
    v90 = *(id *)(a1 + 96);
    +[PXSystemNavigation navigateToDestination:completion:](PXSystemNavigation, "navigateToDestination:completion:", 6, v88);

    return;
  }
  v42 = objc_msgSend(*(id *)(a1 + 80), "isSharedLibraryNotFoundError:", *(_QWORD *)(a1 + 88));
  PLSharedLibraryGetLog();
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (v42)
  {
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v45 = *(_QWORD *)(a1 + 40);
      v46 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v45;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v46;
      v47 = "%{public}@: No Shared Library for URL: %@";
      v48 = v44;
      v49 = OS_LOG_TYPE_DEFAULT;
      v50 = 22;
LABEL_55:
      _os_log_impl(&dword_1A6789000, v48, v49, v47, buf, v50);
    }
  }
  else if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    v63 = *(_QWORD *)(a1 + 40);
    v64 = *(_QWORD *)(a1 + 48);
    v65 = *(void **)(a1 + 88);
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v63;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v64;
    *(_WORD *)&buf[22] = 2112;
    v94 = v65;
    v47 = "%{public}@: Failed to fetch Shared Library for URL: %@, error: %@";
    v48 = v44;
    v49 = OS_LOG_TYPE_ERROR;
    v50 = 32;
    goto LABEL_55;
  }

  v66 = *(void **)(a1 + 80);
  v67 = *(_QWORD *)(a1 + 88);
  v86 = 0;
  v87 = 0;
  v68 = objc_msgSend(v66, "presentCustomInformationForError:customTitle:customMessage:", v67, &v87, &v86);
  v69 = v87;
  v70 = v86;
  if ((v68 & 1) == 0)
  {
    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryFetchInvitationFailureAlertTitle_Transient"));
    v71 = objc_claimAutoreleasedReturnValue();

    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryGenericFailureAlertMessage"));
    v72 = objc_claimAutoreleasedReturnValue();

    v69 = (id)v71;
    v70 = (id)v72;
  }
  v73 = *(void **)(a1 + 72);
  v83[0] = MEMORY[0x1E0C809B0];
  v83[1] = 3221225472;
  v83[2] = ___HandleSharedLibraryOrInvitationURL_block_invoke_463;
  v83[3] = &unk_1E5148CE0;
  v74 = *(void **)(a1 + 88);
  v85 = *(id *)(a1 + 96);
  v84 = *(id *)(a1 + 88);
  PXPresentFailureWithLocalizedTitle(v69, v70, 0, v74, v73, v83);

}

void ___HandleSharedLibraryOrInvitationURL_block_invoke_462(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLSharedLibraryGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v8 = *(_QWORD *)(a1 + 32);
    v15 = 138543362;
    v16 = v8;
    v9 = "%{public}@: Did navigate to Shared Library preferences";
    v10 = v7;
    v11 = OS_LOG_TYPE_DEFAULT;
    v12 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v13 = *(_QWORD *)(a1 + 32);
    v15 = 138543618;
    v16 = v13;
    v17 = 2112;
    v18 = v5;
    v9 = "%{public}@: Failed to navigate to Shared Library preferences: %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
  }
  _os_log_impl(&dword_1A6789000, v10, v11, v9, (uint8_t *)&v15, v12);
LABEL_7:

  v14 = *(_QWORD *)(a1 + 40);
  if (v14)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v14 + 16))(v14, 1, 0);

}

uint64_t ___HandleSharedLibraryOrInvitationURL_block_invoke_463(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

@end
