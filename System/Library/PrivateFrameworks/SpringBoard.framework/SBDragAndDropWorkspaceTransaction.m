@implementation SBDragAndDropWorkspaceTransaction

+ (BOOL)shouldTrackLocationOfDropSession:(id)a3 forSwitcherController:(id)a4
{
  return objc_msgSend(a1, "_shouldTrackLocationOfDropSession:forSwitcherController:isCurrentlyTracking:", a3, a4, 0);
}

+ (UIEdgeInsets)_screenInsetsForUIDragDropSession:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  char v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  SBFSafeProtocolCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0.0;
  v6 = 0.0;
  if (objc_msgSend(v4, "_drivenByPointer"))
  {
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "universalControlServer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "externalProcessActiveOnScreenEdges");

    if ((v9 & 2) != 0)
    {
      objc_msgSend(a1, "prototypeSettingsContentDraggingCommandeerInsetForUniversalControl");
      v6 = v10;
    }
    if ((v9 & 8) != 0)
    {
      objc_msgSend(a1, "prototypeSettingsContentDraggingCommandeerInsetForUniversalControl");
      v5 = v11;
    }
  }

  v12 = 0.0;
  v13 = 0.0;
  v14 = v6;
  v15 = v5;
  result.right = v15;
  result.bottom = v13;
  result.left = v14;
  result.top = v12;
  return result;
}

+ (BOOL)_shouldTrackLocationOfDropSession:(id)a3 forSwitcherController:(id)a4 isCurrentlyTracking:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  BOOL v50;
  char v51;
  uint64_t v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  double v61;
  double v62;
  __n128 v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  unint64_t v71;
  void *v72;
  __int128 v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  uint64_t i;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  void *v101;
  CGFloat v102;
  CGFloat v103;
  CGFloat v104;
  CGFloat v105;
  BOOL v106;
  void *v108;
  id v109;
  id v110;
  id obj;
  unsigned int (**v112)(double, double, double, double, __n128);
  CGFloat v113;
  CGFloat v114;
  double v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _QWORD v120[4];
  id v121;
  id v122;
  uint64_t *v123;
  uint64_t *v124;
  double v125;
  double v126;
  uint64_t v127;
  double *v128;
  uint64_t v129;
  void *v130;
  __int128 v131;
  __int128 v132;
  uint64_t v133;
  uint64_t *v134;
  uint64_t v135;
  uint64_t (*v136)(uint64_t, uint64_t);
  void (*v137)(uint64_t);
  id v138;
  _QWORD v139[4];
  id v140;
  id v141;
  double v142;
  double v143;
  _BYTE v144[128];
  _QWORD v145[3];
  CGPoint v146;
  CGPoint v147;
  CGPoint v148;
  CGPoint v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;

  v5 = a5;
  v145[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "uiDragDropSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "startLocation");

  if (v12 == 8
    || (SBApplicationDropSessionGetDragItem(v10),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v13))
  {
    objc_msgSend(v9, "contentViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_class();
    v16 = v14;
    if (v15)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
    }
    else
    {
      v17 = 0;
    }
    v18 = v17;

    objc_msgSend(v18, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "window");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "screen");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "fixedCoordinateSpace");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locationInView:", v23);
    v25 = v24;
    v27 = v26;

    objc_msgSend(v18, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "convertPoint:toCoordinateSpace:", v22, v25, v27);
    v113 = v30;
    v114 = v29;

    v145[0] = *MEMORY[0x1E0DC6128];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v145, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v20) = objc_msgSend(v10, "hasItemsConformingToTypeIdentifiers:", v31);

    if ((_DWORD)v20)
    {
      objc_msgSend((id)SBApp, "notificationDispatcher");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "bannerDestination");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "presentedBannerScreenFrame");
      v151 = CGRectInset(v150, -50.0, -50.0);
      x = v151.origin.x;
      y = v151.origin.y;
      width = v151.size.width;
      height = v151.size.height;

      v152.origin.x = x;
      v152.origin.y = y;
      v152.size.width = width;
      v152.size.height = height;
      v146.y = v113;
      v146.x = v114;
      if (CGRectContainsPoint(v152, v146))
        goto LABEL_15;
    }
    objc_msgSend(v18, "view");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "bounds");
    v40 = v39;
    v42 = v41;
    v44 = v43;
    v46 = v45;

    UIRectInset();
    v147.x = v25;
    v147.y = v27;
    if (!CGRectContainsPoint(v153, v147))
    {
LABEL_15:
      v51 = 0;
LABEL_64:

      goto LABEL_65;
    }
    if (objc_msgSend(v9, "isChamoisWindowingUIEnabled"))
    {
      if (objc_msgSend(v18, "_areContinuousExposeStripsUnoccluded"))
      {
        objc_msgSend(v18, "chamoisLayoutAttributes");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "stripWidth");
        v49 = v48;
        if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
        {
          v154.origin.x = v40;
          v154.origin.y = v42;
          v154.size.width = v44;
          v154.size.height = v46;
          v50 = v25 > CGRectGetMaxX(v154) - v49;
        }
        else
        {
          v155.origin.x = v40;
          v155.origin.y = v42;
          v155.size.width = v44;
          v155.size.height = v46;
          v50 = v25 < v49 + CGRectGetMinX(v155);
        }

      }
      else
      {
        v50 = 0;
      }
      v52 = objc_msgSend(v8, "dropZones");
      if (v52 == 1)
      {
        objc_msgSend(v18, "_itemContainerAtLocation:environment:", 0, v25, v27);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v53;
        if (!v53 || (objc_msgSend(v53, "size"), v44 != v56) || v46 != v55)
        {
          if (v54)
            v51 = 0;
          else
            v51 = !v50;

          goto LABEL_64;
        }

      }
      else if (!v52)
      {
        v51 = !v50;
        goto LABEL_64;
      }
    }
    v57 = objc_msgSend(a1, "isDragOverFullscreenRegionAtLocation:inBounds:", v25, v27, v40, v42, v44, v46);
    v58 = MEMORY[0x1E0C809B0];
    v139[0] = MEMORY[0x1E0C809B0];
    v139[1] = 3221225472;
    v139[2] = __113__SBDragAndDropWorkspaceTransaction__shouldTrackLocationOfDropSession_forSwitcherController_isCurrentlyTracking___block_invoke;
    v139[3] = &unk_1E8EB2100;
    v141 = a1;
    v142 = v25;
    v143 = v27;
    v140 = v10;
    v112 = (unsigned int (**)(double, double, double, double, __n128))MEMORY[0x1D17E5550](v139);
    v59 = objc_msgSend(v8, "dropZones");
    if (v59)
    {
      if (v59 != 2)
      {
        if (v59 == 1)
        {
          if (v5)
          {
            objc_msgSend(a1, "prototypeSettingsContentDraggingSideActivationWidth");
            v61 = v60;
            objc_msgSend(a1, "prototypeSettingsContentDraggingFloatingActivationWidth");
            v63.n128_f64[0] = v61 + v62;
            if ((v57 & 1) != 0)
              goto LABEL_42;
          }
          else
          {
            objc_msgSend(a1, "prototypeSettingsContentDraggingCommandeerWidth");
            v63.n128_u64[0] = v71;
            if ((v57 & 1) != 0)
            {
LABEL_42:
              objc_msgSend(v9, "layoutState");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              v133 = 0;
              v134 = &v133;
              v135 = 0x3032000000;
              v136 = __Block_byref_object_copy__70;
              v137 = __Block_byref_object_dispose__70;
              v138 = 0;
              v127 = 0;
              v128 = (double *)&v127;
              v129 = 0x4010000000;
              v130 = &unk_1D0FA064E;
              v73 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
              v131 = *MEMORY[0x1E0C9D648];
              v132 = v73;
              v120[0] = v58;
              v120[1] = 3221225472;
              v120[2] = __113__SBDragAndDropWorkspaceTransaction__shouldTrackLocationOfDropSession_forSwitcherController_isCurrentlyTracking___block_invoke_73;
              v120[3] = &unk_1E8EB2128;
              v123 = &v133;
              v109 = v72;
              v121 = v109;
              v125 = v25;
              v126 = v27;
              v122 = v9;
              v124 = &v127;
              SBLayoutRoleEnumerateValidRoles(v120);
              objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v134[5], "uniqueIdentifier");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "sceneWithIdentifier:", v75);
              v110 = (id)objc_claimAutoreleasedReturnValue();

              v76 = v110;
              if (v110)
              {
                objc_msgSend(v110, "clientSettings");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                v78 = objc_msgSend(v77, "isUISubclass");

                if (v78)
                {
                  objc_msgSend(v18, "view");
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v79, "convertRect:toCoordinateSpace:", v22, v128[4], v128[5], v128[6], v128[7]);
                  v81 = v80;
                  v83 = v82;
                  v85 = v84;
                  v87 = v86;

                  objc_msgSend(v110, "clientSettings");
                  v88 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v88, "multitaskingDragExclusionRects");
                  v118 = 0u;
                  v119 = 0u;
                  v116 = 0u;
                  v117 = 0u;
                  obj = (id)objc_claimAutoreleasedReturnValue();
                  v89 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v144, 16);
                  v108 = v88;
                  if (v89)
                  {
                    v90 = *(_QWORD *)v117;
                    v91 = 1;
                    while (2)
                    {
                      for (i = 0; i != v89; ++i)
                      {
                        if (*(_QWORD *)v117 != v90)
                          objc_enumerationMutation(obj);
                        objc_msgSend(*(id *)(*((_QWORD *)&v116 + 1) + 8 * i), "CGRectValue");
                        v94 = v93;
                        v96 = v95;
                        v98 = v97;
                        v100 = v99;
                        +[SBSceneLayoutCoordinateSpace coordinateSpaceForFrame:withinCoordinateSpace:](SBSceneLayoutCoordinateSpace, "coordinateSpaceForFrame:withinCoordinateSpace:", v22, v81, v83, v85, v87);
                        v101 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v101, "convertRect:toCoordinateSpace:", v22, v94, v96, v98, v100);
                        v102 = v158.origin.x;
                        v103 = v158.origin.y;
                        v104 = v158.size.width;
                        v105 = v158.size.height;
                        if (!CGRectIsNull(v158))
                        {
                          v159.origin.x = v102;
                          v159.origin.y = v103;
                          v159.size.width = v104;
                          v159.size.height = v105;
                          v149.y = v113;
                          v149.x = v114;
                          v106 = CGRectContainsPoint(v159, v149);
                          v91 = !v106;
                          if (v106)
                          {

                            goto LABEL_60;
                          }
                        }

                      }
                      v89 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v144, 16);
                      if (v89)
                        continue;
                      break;
                    }
                  }
                  else
                  {
                    v91 = 1;
                  }
LABEL_60:

                  v51 = v91 & 1;
                }
                else
                {
                  v51 = 1;
                }
                v76 = v110;
              }
              else
              {
                v51 = 1;
              }

              _Block_object_dispose(&v127, 8);
              _Block_object_dispose(&v133, 8);

              goto LABEL_63;
            }
          }
          if (v112[2](v40, v42, v44, v46, v63))
            goto LABEL_42;
        }
        v51 = 0;
LABEL_63:

        goto LABEL_64;
      }
      objc_msgSend(a1, "prototypeSettingsWindowTearOffDraggingSideActivationWidth");
      v115 = v64;
      objc_msgSend(a1, "prototypeSettingsWindowTearOffDraggingFloatingActivationWidth");
      v66 = v65;
      objc_msgSend(a1, "sourceSceneInterfaceOrientedBoundsForDropSession:switcherController:", v8, v9);
      v67 = v156.origin.x;
      v68 = v156.origin.y;
      v69 = v156.size.width;
      v70 = v156.size.height;
      if (!CGRectIsNull(v156))
      {
        v157.origin.x = v67;
        v157.origin.y = v68;
        v157.size.width = v69;
        v157.size.height = v70;
        v148.x = v25;
        v148.y = v27;
        if (((v57 | !CGRectContainsPoint(v157, v148)) & 1) == 0)
        {
          v51 = ((uint64_t (*)(double, double, double, double, double))v112[2])(v67, v68, v69, v70, (v115 + v66) * (v69 / v44));
          goto LABEL_63;
        }
      }
    }
    v51 = 1;
    goto LABEL_63;
  }
  v51 = 0;
LABEL_65:

  return v51;
}

BOOL __113__SBDragAndDropWorkspaceTransaction__shouldTrackLocationOfDropSession_forSwitcherController_isCurrentlyTracking___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6)
{
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v12 = *(void **)(a1 + 40);
  objc_msgSend(v12, "_screenInsetsForUIDragDropSession:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(v12, "screenEdgeForDragOverSideGutterRegionsAtLocation:inBounds:totalContentDragGutterWidth:screenInsets:", *(double *)(a1 + 48), *(double *)(a1 + 56), a2, a3, a4, a5, a6, v13, v14, v15, v16) != 0;
}

void __113__SBDragAndDropWorkspaceTransaction__shouldTrackLocationOfDropSession_forSwitcherController_isCurrentlyTracking___block_invoke_73(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  _QWORD *v23;
  id obj;

  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!v4 || objc_msgSend(v4, "layoutRole") != 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "elementWithRole:", a2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
    {
      obj = (id)v5;
      v7 = *(void **)(a1 + 32);
      v8 = *(void **)(a1 + 40);
      if (a2 == 3)
      {
        objc_msgSend(v8, "frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:", objc_msgSend(v7, "interfaceOrientation"), objc_msgSend(*(id *)(a1 + 32), "floatingConfiguration"));
        v10 = v9;
        v12 = v11;
        v14 = v13;
        v16 = v15;
      }
      else
      {
        objc_msgSend(v7, "appLayout");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "frameForItemWithRole:inMainAppLayout:interfaceOrientation:", a2, v17, objc_msgSend(*(id *)(a1 + 32), "interfaceOrientation"));
        v10 = v18;
        v12 = v19;
        v14 = v20;
        v16 = v21;

      }
      v22 = SBRectContainsPoint();
      v6 = obj;
      if (v22)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
        v6 = obj;
        v23 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8);
        v23[4] = v10;
        v23[5] = v12;
        v23[6] = v14;
        v23[7] = v16;
      }
    }

  }
}

+ (CGRect)sourceSceneInterfaceOrientedBoundsForDropSession:(id)a3 switcherController:(id)a4
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGRect result;

  v5 = a4;
  objc_msgSend(a3, "systemSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applicationWithPid:", objc_msgSend(v7, "processIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sceneManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sceneIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sceneIdentifierForBundleIdentifier:uniqueIdentifier:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "layoutState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "elementWithIdentifier:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if (objc_msgSend(v16, "layoutRole") == 3)
    {
      objc_msgSend(v5, "frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:", objc_msgSend(v15, "interfaceOrientation"), objc_msgSend(v15, "floatingConfiguration"));
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;
    }
    else
    {
      v26 = objc_msgSend(v5, "interfaceOrientationForLayoutElement:", v17);
      v27 = objc_msgSend(v17, "layoutRole");
      objc_msgSend(v15, "appLayout");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "frameForItemWithRole:inMainAppLayout:interfaceOrientation:", v27, v28, v26);
      v19 = v29;
      v21 = v30;
      v23 = v31;
      v25 = v32;

    }
  }
  else
  {
    v19 = *MEMORY[0x1E0C9D628];
    v21 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v23 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v25 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v33 = v19;
  v34 = v21;
  v35 = v23;
  v36 = v25;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

+ (BOOL)isDragOverFullscreenRegionAtLocation:(CGPoint)a3 inBounds:(CGRect)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  objc_msgSend(a1, "prototypeSettingsFullscreenActivationRegionSize");
  SBRectWithSize();
  UIRectCenteredXInRect();
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

+ (unint64_t)screenEdgeForDragOverSideGutterRegionsAtLocation:(CGPoint)a3 inBounds:(CGRect)a4 totalContentDragGutterWidth:(double)a5 screenInsets:(UIEdgeInsets)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v15;
  double v16;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3.x;
  v12 = a6.left + CGRectGetMinX(a4);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v13 = CGRectGetMinX(v19) + a5;
  if (v11 > v12 && v11 < v13)
    return 2;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v15 = CGRectGetMaxX(v20) - a6.right;
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v16 = CGRectGetMaxX(v21) - a5;
  if (v11 >= v15 || v11 <= v16)
    return 0;
  else
    return 8;
}

- (SBDragAndDropWorkspaceTransaction)initWithTransitionRequest:(id)a3 switcherController:(id)a4 dropSession:(id)a5 delegate:(id)a6
{
  id v10;
  char *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  SBTouchHistory *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v58;
  void *v59;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  id obj;
  id v69;
  id v70;
  id location;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  objc_super v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  obj = a4;
  v69 = a5;
  v66 = a6;
  v76.receiver = self;
  v76.super_class = (Class)SBDragAndDropWorkspaceTransaction;
  v64 = v10;
  v11 = -[SBMainWorkspaceTransaction initWithTransitionRequest:](&v76, sel_initWithTransitionRequest_, v10);
  if (v11)
  {
    objc_msgSend(obj, "contentViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_class();
    v14 = v12;
    if (v13)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
    }
    else
    {
      v15 = 0;
    }
    v63 = v15;

    objc_msgSend(obj, "windowScene");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sceneManager");
    v67 = (id)objc_claimAutoreleasedReturnValue();

    objc_storeWeak((id *)v11 + 26, obj);
    objc_storeWeak((id *)v11 + 27, v63);
    objc_storeWeak((id *)v11 + 28, v67);
    objc_storeWeak((id *)v11 + 29, v66);
    objc_storeStrong((id *)v11 + 33, a5);
    *((_QWORD *)v11 + 34) = 0;
    *((_QWORD *)v11 + 39) = 0;
    *(_OWORD *)(v11 + 344) = SBInvalidSize;
    v17 = objc_alloc_init(SBTouchHistory);
    v18 = (void *)*((_QWORD *)v11 + 57);
    *((_QWORD *)v11 + 57) = v17;

    +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)*((_QWORD *)v11 + 58);
    *((_QWORD *)v11 + 58) = v19;

    +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "chamoisSettings");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)*((_QWORD *)v11 + 59);
    *((_QWORD *)v11 + 59) = v22;

    objc_msgSend(obj, "layoutState");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)*((_QWORD *)v11 + 30);
    *((_QWORD *)v11 + 30) = v24;

    objc_storeStrong((id *)v11 + 31, *((id *)v11 + 30));
    objc_msgSend(v69, "application");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v65)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("SBDragAndDropWorkspaceTransaction.m"), 486, CFSTR("Cannot begin a drop app transaction without an application."));

    }
    +[SBDraggingSystemManager sharedInstance](SBDraggingSystemManager, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "systemSession");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setCommandeered:forDraggingSystemSession:forReason:", 1, v27, v29);

    objc_msgSend(v69, "sceneIdentity");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "displayIdentity");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBApplicationSceneHandleRequest defaultRequestForApplication:sceneIdentity:displayIdentity:](SBApplicationSceneHandleRequest, "defaultRequestForApplication:sceneIdentity:displayIdentity:", v65, v62, v30);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = objc_opt_class();
    objc_msgSend(v67, "fetchOrCreateApplicationSceneHandleForRequest:", v61);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v31, v32);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)*((_QWORD *)v11 + 35);
    *((_QWORD *)v11 + 35) = v33;

    if (!*((_QWORD *)v11 + 35))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("SBDragAndDropWorkspaceTransaction.m"), 492, CFSTR("Not dragging a valid application. _draggingApplicationSceneHandle is nil."));

    }
    objc_msgSend(*((id *)v11 + 33), "localContext");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "startLocation") == 8;

    if (v36)
    {
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      objc_msgSend(*((id *)v11 + 31), "elements");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
      if (v38)
      {
        v39 = *(_QWORD *)v73;
        while (2)
        {
          for (i = 0; i != v38; ++i)
          {
            if (*(_QWORD *)v73 != v39)
              objc_enumerationMutation(v37);
            v41 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
            objc_msgSend(v41, "uniqueIdentifier");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*((id *)v11 + 35), "sceneIdentifier");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v42, "isEqualToString:", v43);

            if (v44)
            {
              v45 = v41;
              goto LABEL_22;
            }
          }
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
          if (v38)
            continue;
          break;
        }
      }
      v45 = 0;
LABEL_22:

      v46 = (void *)*((_QWORD *)v11 + 45);
      *((_QWORD *)v11 + 45) = v45;

    }
    v47 = objc_opt_class();
    objc_msgSend(v69, "localContext");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "portaledPreview");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v47, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)v11 + 51, v50);
    objc_msgSend(v69, "uiDragDropSession");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    SBFSafeProtocolCast();
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      v11[288] = 1;
      if (!v50)
        objc_msgSend(v11, "_setupPlatterPreviewForContentDrag");
    }
    objc_initWeak(&location, v11);
    v53 = MEMORY[0x1E0C80D38];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SpringBoard - DragAndDropTransaction - %p"), v11);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_copyWeak(&v70, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = (void *)*((_QWORD *)v11 + 62);
    *((_QWORD *)v11 + 62) = v55;

    objc_destroyWeak(&v70);
    objc_destroyWeak(&location);

  }
  return (SBDragAndDropWorkspaceTransaction *)v11;
}

id __103__SBDragAndDropWorkspaceTransaction_initWithTransitionRequest_switcherController_dropSession_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  id (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", WeakRetained);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __103__SBDragAndDropWorkspaceTransaction_initWithTransitionRequest_switcherController_dropSession_delegate___block_invoke_2;
    v9 = &unk_1E8E9E820;
    v10 = v2;
    v11 = WeakRetained;
    v3 = v2;
    objc_msgSend(v3, "appendBodySectionWithName:multilinePrefix:block:", 0, 0, &v6);
    objc_msgSend(v3, "build", v6, v7, v8, v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __103__SBDragAndDropWorkspaceTransaction_initWithTransitionRequest_switcherController_dropSession_delegate___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 272), CFSTR("sessionState"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 312), CFSTR("currentDropAction"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 376), CFSTR("sceneUpdateTransactionForWindowDrag"));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 400), CFSTR("pendingSceneUpdatesTransactions"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 176), CFSTR("transitionRequest"));
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_stateCaptureInvalidatable, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBDragAndDropWorkspaceTransaction;
  -[SBDragAndDropWorkspaceTransaction dealloc](&v3, sel_dealloc);
}

- (void)_setupPlatterPreviewForContentDrag
{
  SBApplicationDropSession *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  SBApplicationDropSession *v9;
  _QWORD v10[5];
  SBApplicationDropSession *v11;
  id v12;

  if (!self->_activePlatterPreview)
  {
    v3 = self->_dropSession;
    -[SBApplicationDropSession uiDragDropSession](v3, "uiDragDropSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SBFSafeProtocolCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    SBApplicationDropSessionGetDragItem(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SBFSafeProtocolCast();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __71__SBDragAndDropWorkspaceTransaction__setupPlatterPreviewForContentDrag__block_invoke;
    v10[3] = &unk_1E8EB2178;
    v10[4] = self;
    v11 = v3;
    v12 = v6;
    v8 = v6;
    v9 = v3;
    objc_msgSend(v7, "requestVisibleItems:", v10);

  }
}

void __71__SBDragAndDropWorkspaceTransaction__setupPlatterPreviewForContentDrag__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  dispatch_time_t v13;
  _QWORD block[5];
  _QWORD v15[4];
  id v16;
  id v17;

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 424);
  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (v3 || *(_QWORD *)(v4 + 424) >= 4uLL)
  {
    objc_storeStrong((id *)(v4 + 432), v3);
    objc_msgSend(*(id *)(a1 + 40), "application");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_createPlatterPreviewForApplication:withSourceView:dropSession:", v5, v3, *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_configurePlatterPreview:forSceneHandle:completion:", v6, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280), 0);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01730]), "initWithCornerRadius:", 10.0);
    objc_msgSend(v6, "setCornerRadiusConfiguration:", v7);

    objc_msgSend(v6, "layoutIfNeeded");
    v8 = *(void **)(a1 + 48);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __71__SBDragAndDropWorkspaceTransaction__setupPlatterPreviewForContentDrag__block_invoke_2;
    v15[3] = &unk_1E8EB2150;
    v9 = v6;
    v16 = v9;
    v17 = *(id *)(a1 + 40);
    objc_msgSend(v8, "setPreviewProvider:", v15);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 408);
    *(_QWORD *)(v10 + 408) = v9;
    v12 = v9;

  }
  else
  {
    v13 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__SBDragAndDropWorkspaceTransaction__setupPlatterPreviewForContentDrag__block_invoke_3;
    block[3] = &unk_1E8E9DED8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_after(v13, MEMORY[0x1E0C80D38], block);
  }

}

id __71__SBDragAndDropWorkspaceTransaction__setupPlatterPreviewForContentDrag__block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA560]), "initWithView:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(*(id *)(a1 + 40), "isWindowTearOff"))
  {
    objc_msgSend(*(id *)(a1 + 32), "bounds");
    v4 = 33.0 / v3;
  }
  else
  {
    v4 = 0.5;
  }
  objc_msgSend(*(id *)(a1 + 32), "setAnchorPoint:", 0.5, v4);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(v2, "setPreferredAnchorPoint:", 0.5 * v5, v4 * v6);
  objc_msgSend(v2, "set_springboardPlatterStyle:", 1);
  objc_msgSend(v2, "setAvoidAnimation:", 1);
  return v2;
}

uint64_t __71__SBDragAndDropWorkspaceTransaction__setupPlatterPreviewForContentDrag__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isRunning");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_setupPlatterPreviewForContentDrag");
  return result;
}

+ (double)prototypeSettingsSideActivationGutterSize
{
  void *v2;
  double v3;
  double v4;

  +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "draggingPlatterSideActivationGutterPadding");
  v4 = v3;

  return v4;
}

+ (CGSize)prototypeSettingsFullscreenActivationRegionSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "draggingPlatterFullscreenActivationRegionWidth");
  v4 = v3;
  objc_msgSend(v2, "draggingPlatterFullscreenActivationRegionHeight");
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

+ (double)prototypeSettingsContentDraggingCommandeerInsetForUniversalControl
{
  void *v2;
  double v3;
  double v4;

  +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentDraggingCommandeerGutterInsetForUniversalControl");
  v4 = v3;

  return v4;
}

+ (double)prototypeSettingsContentDraggingCommandeerWidth
{
  void *v2;
  double v3;
  double v4;

  +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentDraggingCommandeerGutterWidth");
  v4 = v3;

  return v4;
}

+ (double)prototypeSettingsContentDraggingSideActivationWidth
{
  void *v2;
  double v3;
  double v4;

  +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentDraggingSideActivationGutterWidth");
  v4 = v3;

  return v4;
}

+ (double)prototypeSettingsContentDraggingFloatingActivationWidth
{
  void *v2;
  double v3;
  double v4;

  +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentDraggingFloatingActivationGutterWidth");
  v4 = v3;

  return v4;
}

+ (double)prototypeSettingsWindowTearOffDraggingSideActivationWidth
{
  void *v2;
  double v3;
  double v4;

  +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowTearOffDraggingSideActivationGutterWidth");
  v4 = v3;

  return v4;
}

+ (double)prototypeSettingsWindowTearOffDraggingFloatingActivationWidth
{
  void *v2;
  double v3;
  double v4;

  +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowTearOffDraggingFloatingActivationGutterWidth");
  v4 = v3;

  return v4;
}

- (BOOL)matchesApplicationDropSession:(id)a3
{
  return self->_dropSession == a3;
}

- (BOOL)matchesUIDragDropSession:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  -[SBApplicationDropSession uiDragDropSession](self->_dropSession, "uiDragDropSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v9 = 1;
  }
  else
  {
    SBFSafeProtocolCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBApplicationDropSession uiDragDropSession](self->_dropSession, "uiDragDropSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localDragSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7 == v8;

  }
  return v9;
}

- (void)blurReadinessDidChange
{
  -[SBDragAndDropWorkspaceTransaction _updatePlatterPreviewForSetDown:animated:](self, "_updatePlatterPreviewForSetDown:animated:", 1, 1);
}

- (BOOL)isDragging
{
  return -[SBDragAndDropWorkspaceTransaction isWaitingForMilestone:](self, "isWaitingForMilestone:", CFSTR("SBDragAndDropAppActivationDraggingMilestone"));
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  void *v6;
  objc_class *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDragAndDropWorkspaceTransaction.m"), 659, CFSTR("%s shouldn't be forwarded to %@"), "-[SBDragAndDropWorkspaceTransaction dragInteraction:itemsForBeginningSession:]", v8);

  return 0;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  SBApplicationDropSession *v12;
  void *v13;
  void *v14;
  void *v15;
  SBAppPlatterDragPreview *v16;
  void *v17;
  void *v18;
  void *v19;
  SBAppPlatterDragPreview *activePlatterPreview;
  SBAppPlatterDragPreview *v21;
  SBAppPlatterDragSourceViewProviding *activeSourceViewProvider;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v28;

  v8 = a5;
  v9 = a3;
  v10 = objc_opt_class();
  SBSafeCast(v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDragAndDropWorkspaceTransaction.m"), 665, CFSTR("We can only provide lift previews for window drags."));

  }
  v12 = self->_dropSession;
  -[SBApplicationDropSession application](v12, "application");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sourceViewProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sourceView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDragAndDropWorkspaceTransaction _createPlatterPreviewForApplication:withSourceView:dropSession:](self, "_createPlatterPreviewForApplication:withSourceView:dropSession:", v13, v15, v12);
  v16 = (SBAppPlatterDragPreview *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "initialCornerRadiusConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppPlatterDragPreview setCornerRadiusConfiguration:](v16, "setCornerRadiusConfiguration:", v17);

  objc_msgSend(v14, "initialDiffuseShadowParameters");
  -[SBAppPlatterDragPreview setDiffuseShadowParameters:](v16, "setDiffuseShadowParameters:");
  objc_msgSend(v14, "initialRimShadowParameters");
  -[SBAppPlatterDragPreview setRimShadowParameters:](v16, "setRimShadowParameters:");
  objc_msgSend(v14, "initialDiffuseShadowFilters");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppPlatterDragPreview setDiffuseShadowFilters:](v16, "setDiffuseShadowFilters:", v18);

  objc_msgSend(v14, "initialRimShadowFilters");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppPlatterDragPreview setRimShadowFilters:](v16, "setRimShadowFilters:", v19);

  -[SBAppPlatterDragPreview setDragState:](v16, "setDragState:", 1);
  -[SBAppPlatterDragPreview layoutIfNeeded](v16, "layoutIfNeeded");
  activePlatterPreview = self->_activePlatterPreview;
  self->_activePlatterPreview = v16;
  v21 = v16;

  activeSourceViewProvider = self->_activeSourceViewProvider;
  self->_activeSourceViewProvider = (SBAppPlatterDragSourceViewProviding *)v14;
  v23 = v14;

  -[SBDragAndDropWorkspaceTransaction _updateActiveSourceViewProviderWithDragState:](self, "_updateActiveSourceViewProviderWithDragState:", 1);
  -[SBApplicationDropSession localContext](v12, "localContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setPortaledPreview:", v21);

  v25 = objc_alloc(MEMORY[0x1E0CEAA90]);
  v26 = (void *)objc_msgSend(v25, "initWithView:", v21);
  objc_msgSend(v26, "set_springboardPlatterStyle:", 1);
  objc_msgSend(v8, "locationInView:", v15);

  objc_msgSend(v15, "bounds");
  -[SBDragAndDropWorkspaceTransaction _updateAnchorPointForPlatterPreview:dragPreview:withSourceViewBounds:location:](self, "_updateAnchorPointForPlatterPreview:dragPreview:withSourceViewBounds:location:", v21, v26);

  return v26;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  self->_windowLiftAnimationCompleted = 1;
  -[SBDragAndDropWorkspaceTransaction _updatePlatterPreviewForSetDown:animated:](self, "_updatePlatterPreviewForSetDown:animated:", 0, 1);
}

- (void)dragInteraction:(id)a3 sessionDidMove:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (!self->_beganTrackingDropSession && !self->_performedDrop)
    -[SBDragAndDropWorkspaceTransaction _handleSessionDidUpdate:](self, "_handleSessionDidUpdate:", v6);

}

- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5
{
  char v7;
  id v8;

  v8 = a4;
  v7 = -[SBDragAndDropWorkspaceTransaction isInterrupted](self, "isInterrupted");
  if (!a5 && (v7 & 1) == 0)
    -[SBDragAndDropWorkspaceTransaction _handleSessionDidPerformDrop:](self, "_handleSessionDidPerformDrop:", v8);

}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  char v7;
  id v8;

  v8 = a4;
  v7 = -[SBDragAndDropWorkspaceTransaction isInterrupted](self, "isInterrupted");
  if (!a5 && (v7 & 1) == 0)
    -[SBDragAndDropWorkspaceTransaction _handleSessionDidEnd:](self, "_handleSessionDidEnd:", v8);
  -[SBAppPlatterDragPreview draggingSourceDroppedWithOperation:](self->_activePlatterPreview, "draggingSourceDroppedWithOperation:", a5);

}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a5;
  if ((-[SBDragAndDropWorkspaceTransaction isInterrupted](self, "isInterrupted") & 1) == 0
    && -[SBDragAndDropWorkspaceTransaction _layoutRoleForDropAction:](self, "_layoutRoleForDropAction:", self->_currentDropAction))
  {
    -[SBDragAndDropWorkspaceTransaction _dragPreviewForDroppingItem:withDefault:](self, "_dragPreviewForDroppingItem:withDefault:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  id v6;
  _QWORD v7[5];

  v6 = a5;
  if ((-[SBDragAndDropWorkspaceTransaction isInterrupted](self, "isInterrupted") & 1) == 0
    && -[SBDragAndDropWorkspaceTransaction _layoutRoleForDropAction:](self, "_layoutRoleForDropAction:", self->_currentDropAction))
  {
    -[SBDragAndDropWorkspaceTransaction _handleWillAnimateDropWithAnimator:](self, "_handleWillAnimateDropWithAnimator:", v6);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __88__SBDragAndDropWorkspaceTransaction_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke;
    v7[3] = &unk_1E8EA2880;
    v7[4] = self;
    objc_msgSend(v6, "addCompletion:", v7);
  }

}

uint64_t __88__SBDragAndDropWorkspaceTransaction_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 408), "draggingSourceCancelAnimationCompleted");
}

- (void)_dragInteractionDidCancelLiftWithoutDragging:(id)a3
{
  id v4;

  -[SBAppPlatterDragPreview draggingSourceCancelAnimationCompleted](self->_activePlatterPreview, "draggingSourceCancelAnimationCompleted", a3);
  -[SBApplicationDropSession uiDragDropSession](self->_dropSession, "uiDragDropSession");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBDragAndDropWorkspaceTransaction _handleSessionDidEnd:](self, "_handleSessionDidEnd:", v4);

}

- (id)_dragInteraction:(id)a3 customSpringAnimationBehaviorForCancellingItem:(id)a4
{
  return -[SBMedusaSettings dropAnimationSettings](self->_medusaSettings, "dropAnimationSettings", a3, a4);
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  self->_beganTrackingDropSession = 1;
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v5;
  _BOOL4 v6;
  int v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;

  self->_beganTrackingDropSession = 1;
  v5 = a4;
  v6 = -[SBDragAndDropWorkspaceTransaction _handleSessionDidUpdate:](self, "_handleSessionDidUpdate:", v5);
  v7 = objc_msgSend(v5, "allowsMoveOperation");

  if (v7)
    v8 = 3;
  else
    v8 = 2;
  v9 = objc_alloc(MEMORY[0x1E0CEA590]);
  if (v6)
    v10 = v8;
  else
    v10 = 0;
  v11 = (void *)objc_msgSend(v9, "initWithDropOperation:", v10);
  objc_msgSend(v11, "_setPreferredBadgeStyle:", 1);
  return v11;
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  if (!self->_performedDrop)
    -[SBDragAndDropWorkspaceTransaction _handleSessionDidUpdate:](self, "_handleSessionDidUpdate:", a4);
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  -[SBDragAndDropWorkspaceTransaction _handleSessionDidPerformDrop:](self, "_handleSessionDidPerformDrop:", a4);
}

- (void)dropInteraction:(id)a3 concludeDrop:(id)a4
{
  if ((-[SBDragAndDropWorkspaceTransaction isInterrupted](self, "isInterrupted", a3, a4) & 1) == 0)
    self->_sessionState = 2;
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a4;
  if ((-[SBDragAndDropWorkspaceTransaction isInterrupted](self, "isInterrupted") & 1) == 0)
  {
    if (!self->_performedDrop)
    {
      if (self->_currentDropAction)
      {
        self->_currentDropAction = 0;
        -[SBDragAndDropWorkspaceTransaction _updateCurrentDropActionProposedLayoutState](self, "_updateCurrentDropActionProposedLayoutState");
      }
      objc_storeStrong((id *)&self->_finalLayoutState, self->_currentLayoutState);
      WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
      -[SBWorkspaceTransitionRequest applicationContext](self->super.super._transitionRequest, "applicationContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "performTransitionWithContext:animated:completion:", v6, 1, 0);

      -[SBDragAndDropWorkspaceTransaction _cleanUpAndCompleteTransactionIfNecessary](self, "_cleanUpAndCompleteTransactionIfNecessary");
    }
    -[SBDragAndDropWorkspaceTransaction _handleSessionDidEnd:](self, "_handleSessionDidEnd:", v7);
  }

}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a5;
  if ((-[SBDragAndDropWorkspaceTransaction isInterrupted](self, "isInterrupted") & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    -[SBDragAndDropWorkspaceTransaction _dragPreviewForDroppingItem:withDefault:](self, "_dragPreviewForDroppingItem:withDefault:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  id v6;

  v6 = a5;
  if ((-[SBDragAndDropWorkspaceTransaction isInterrupted](self, "isInterrupted") & 1) == 0)
    -[SBDragAndDropWorkspaceTransaction _handleWillAnimateDropWithAnimator:](self, "_handleWillAnimateDropWithAnimator:", v6);

}

- (id)_dropInteraction:(id)a3 customSpringAnimationBehaviorForDroppingItem:(id)a4
{
  int64_t currentDropAction;
  SBMedusaSettings *medusaSettings;

  currentDropAction = self->_currentDropAction;
  medusaSettings = self->_medusaSettings;
  if (currentDropAction == 10)
    -[SBMedusaSettings switcherCardDropAnimationSettings](medusaSettings, "switcherCardDropAnimationSettings", a3, a4);
  else
    -[SBMedusaSettings dropAnimationSettings](medusaSettings, "dropAnimationSettings", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_interruptForDragExitedDropZoneIfNecessary
{
  if (self->_dragExitedDropZone && !self->_animatingPlatterPreview)
    -[SBDragAndDropWorkspaceTransaction interruptWithReason:](self, "interruptWithReason:", CFSTR("User moved system content drag outside drop boundaries."));
}

- (BOOL)_handleSessionDidUpdate:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  SBApplicationDropSession *dropSession;
  id WeakRetained;
  char v15;
  void *v16;
  void *v17;
  BOOL v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  _QWORD v27[5];
  char v28;
  _QWORD v29[4];
  id v30;

  v4 = a3;
  v5 = -[SBSwitcherChamoisSettings maximumNumberOfAppsOnStage](self->_chamoisSettings, "maximumNumberOfAppsOnStage");
  -[SBMainDisplayLayoutState appLayout](self->_initialLayoutState, "appLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __61__SBDragAndDropWorkspaceTransaction__handleSessionDidUpdate___block_invoke;
  v29[3] = &unk_1E8E9DF50;
  v30 = v6;
  v9 = v6;
  objc_msgSend(v7, "bs_filter:", v29);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 >= v5
    && -[SBSwitcherChamoisSettings rejectDropsWhenStageIsFull](self->_chamoisSettings, "rejectDropsWhenStageIsFull"))
  {
    goto LABEL_8;
  }
  if ((-[SBDragAndDropWorkspaceTransaction isInterrupted](self, "isInterrupted") & 1) == 0)
  {
    v12 = objc_opt_class();
    dropSession = self->_dropSession;
    WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
    LODWORD(v12) = objc_msgSend((id)v12, "_shouldTrackLocationOfDropSession:forSwitcherController:isCurrentlyTracking:", dropSession, WeakRetained, 1);

    v15 = v12 ^ 1;
    if (self->_dragExitedDropZone != (v12 ^ 1))
    {
      self->_dragExitedDropZone = v15;
      -[SBApplicationDropSession uiDragDropSession](self->_dropSession, "uiDragDropSession");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      SBApplicationDropSessionGetDragItem(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v27[0] = v8;
      v27[1] = 3221225472;
      v27[2] = __61__SBDragAndDropWorkspaceTransaction__handleSessionDidUpdate___block_invoke_2;
      v27[3] = &unk_1E8EB21A0;
      v27[4] = self;
      v28 = v15;
      objc_msgSend(v17, "setPreviewProvider:", v27);
      -[SBDragAndDropWorkspaceTransaction _updatePlatterPreviewForSetDown:animated:](self, "_updatePlatterPreviewForSetDown:animated:", 0, 1);

    }
    -[SBDragAndDropWorkspaceTransaction _interruptForDragExitedDropZoneIfNecessary](self, "_interruptForDragExitedDropZoneIfNecessary");
  }
  if ((-[SBDragAndDropWorkspaceTransaction isInterrupted](self, "isInterrupted") & 1) != 0)
  {
LABEL_8:
    v18 = 0;
  }
  else
  {
    self->_sessionState = 1;
    v19 = objc_loadWeakRetained((id *)&self->_switcherContentController);
    objc_msgSend(v19, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v20);
    v22 = v21;
    v24 = v23;

    -[SBTouchHistory updateWithLocation:timestamp:](self->_touchHistory, "updateWithLocation:timestamp:", v22, v24, CACurrentMediaTime());
    -[SBDragAndDropWorkspaceTransaction _updateForWindowDragForSession:](self, "_updateForWindowDragForSession:", v4);
    -[SBDragAndDropWorkspaceTransaction _updateCurrentDropActionForSession:](self, "_updateCurrentDropActionForSession:", v4);
    -[SBDragAndDropWorkspaceTransaction _updatePlatterPreviewForSetDown:animated:](self, "_updatePlatterPreviewForSetDown:animated:", 0, 1);
    -[SBFluidSwitcherGesture _setState:](self->_dragAndDropGesture, "_setState:", 2);
    v25 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v25, "dragAndDropTransaction:didUpdateGesture:", self, self->_dragAndDropGesture);

    v18 = self->_currentDropAction != 0;
  }

  return v18;
}

BOOL __61__SBDragAndDropWorkspaceTransaction__handleSessionDidUpdate___block_invoke(uint64_t a1, uint64_t a2)
{
  return SBLayoutRoleIsValidForSplitView(objc_msgSend(*(id *)(a1 + 32), "layoutRoleForItem:", a2));
}

id __61__SBDragAndDropWorkspaceTransaction__handleSessionDidUpdate___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA560]), "initWithView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 408));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "bounds");
  v4 = v3;
  if (*(_BYTE *)(a1 + 40))
  {
    v5 = 0.5;
  }
  else
  {
    v5 = 0.5;
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "isWindowTearOff"))
    {
      v6 = 0.5;
      goto LABEL_6;
    }
  }
  v6 = 0.5;
  if (v4 > 0.0)
    v6 = 33.0 / v4;
LABEL_6:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 408), "bounds");
  objc_msgSend(v2, "setPreferredAnchorPoint:", v5 * v7, v6 * v8);
  objc_msgSend(v2, "set_springboardPlatterStyle:", 1);
  objc_msgSend(v2, "setAvoidAnimation:", 1);
  return v2;
}

- (void)_commitRecencyModelUpdateForDropContext:(id)a3
{
  SBSwitcherController **p_switcherController;
  id v4;
  id WeakRetained;

  if (a3)
  {
    p_switcherController = &self->_switcherController;
    v4 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_switcherController);
    objc_msgSend(WeakRetained, "_performSwitcherDropWithContext:", v4);

  }
}

- (void)_handleSessionDidPerformDrop:(id)a3
{
  CADisplayLink *displayLinkForWindowDrag;
  int64_t currentDropAction;
  SBMainWorkspaceTransitionRequest *v6;
  SBMainWorkspaceTransitionRequest *dropTransitionRequest;
  void *v8;
  char v9;
  void *v10;
  SBMainDisplayLayoutState *v11;
  SBMainDisplayLayoutState *finalLayoutState;

  if ((-[SBDragAndDropWorkspaceTransaction isInterrupted](self, "isInterrupted", a3) & 1) == 0)
  {
    self->_performedDrop = 1;
    self->_sessionState = 2;
    -[CADisplayLink invalidate](self->_displayLinkForWindowDrag, "invalidate");
    displayLinkForWindowDrag = self->_displayLinkForWindowDrag;
    self->_displayLinkForWindowDrag = 0;

    currentDropAction = self->_currentDropAction;
    if (currentDropAction == 10)
    {
      -[SBDragAndDropWorkspaceTransaction _commitRecencyModelUpdateForDropContext:](self, "_commitRecencyModelUpdateForDropContext:", self->_currentSwitcherDropRegionContext);
      currentDropAction = self->_currentDropAction;
    }
    -[SBDragAndDropWorkspaceTransaction _transitionRequestForDropAction:](self, "_transitionRequestForDropAction:", currentDropAction);
    v6 = (SBMainWorkspaceTransitionRequest *)objc_claimAutoreleasedReturnValue();
    dropTransitionRequest = self->_dropTransitionRequest;
    self->_dropTransitionRequest = v6;

    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "canExecuteTransitionRequest:", self->_dropTransitionRequest);

    if ((v9 & 1) != 0)
    {
      if (-[SBDragAndDropWorkspaceTransaction _shouldFailLayoutStateTransitionForWindowDrag](self, "_shouldFailLayoutStateTransitionForWindowDrag"))
      {
        objc_storeStrong((id *)&self->_currentLayoutState, self->_initialLayoutState);
      }
      if (!-[SBWorkspaceTransitionRequest isFinalized](self->_dropTransitionRequest, "isFinalized"))
      {
        -[SBMainWorkspaceTransitionRequest finalize](self->_dropTransitionRequest, "finalize");
        -[SBWorkspaceTransitionRequest applicationContext](self->_dropTransitionRequest, "applicationContext");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "layoutState");
        v11 = (SBMainDisplayLayoutState *)objc_claimAutoreleasedReturnValue();

        finalLayoutState = self->_finalLayoutState;
        self->_finalLayoutState = v11;

      }
    }
    else
    {
      -[SBDragAndDropWorkspaceTransaction _cleanUpAndCompleteTransactionIfNecessary](self, "_cleanUpAndCompleteTransactionIfNecessary");
    }
  }
}

- (id)_dragPreviewForDroppingItem:(id)a3 withDefault:(id)a4
{
  int64_t currentDropAction;
  id v7;
  int64_t v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  SBSwitcherDropRegionContext *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t v19;
  void *v20;
  int64_t v21;
  SBMainDisplayLayoutState *finalLayoutState;
  uint64_t v23;
  void *v24;
  id v25;
  __int128 v26;
  void *v27;
  void *v28;
  void *v30;
  _OWORD v31[3];

  currentDropAction = self->_currentDropAction;
  v7 = a4;
  v8 = -[SBDragAndDropWorkspaceTransaction _layoutRoleForDropAction:](self, "_layoutRoleForDropAction:", currentDropAction);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDragAndDropWorkspaceTransaction.m"), 966, CFSTR("Shouldn't be asking for a preview if we're cancelling the drop."));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  objc_msgSend(WeakRetained, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceTransaction windowScene](self, "windowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "switcherController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = self->_currentDropAction;
  if (v13 == 10)
  {
    if (-[SBSwitcherDropRegionContext currentDropRegion](self->_currentSwitcherDropRegionContext, "currentDropRegion"))
    {
      v14 = self->_currentSwitcherDropRegionContext;
      v15 = -[SBSwitcherDropRegionContext currentDropRegion](v14, "currentDropRegion");
      if (v15 <= 7)
      {
        if (((1 << v15) & 0x78) != 0)
        {
          -[SBSwitcherDropRegionContext finalTargetAppLayout](v14, "finalTargetAppLayout");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBSwitcherDropRegionContext draggingLeafAppLayout](v14, "draggingLeafAppLayout");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "itemForLayoutRole:", 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(WeakRetained, "scaledFrameForLayoutRole:inAppLayout:", objc_msgSend(v16, "layoutRoleForItem:", v18), v16);
        }
        else
        {
          -[SBSwitcherDropRegionContext originRect](v14, "originRect");
        }
      }

      goto LABEL_19;
    }
    v13 = self->_currentDropAction;
  }
  if (v13 == 9)
  {
    v19 = -[SBLayoutState interfaceOrientation](self->_finalLayoutState, "interfaceOrientation");
    v20 = v12;
    v21 = 4;
  }
  else if (v13 == 8)
  {
    v19 = -[SBLayoutState interfaceOrientation](self->_finalLayoutState, "interfaceOrientation");
    v20 = v12;
    v21 = 3;
  }
  else
  {
    finalLayoutState = self->_finalLayoutState;
    if (v8 != 3)
    {
      -[SBMainDisplayLayoutState appLayout](finalLayoutState, "appLayout");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "frameForItemWithRole:inMainAppLayout:interfaceOrientation:", v8, v24, -[SBLayoutState interfaceOrientation](self->_finalLayoutState, "interfaceOrientation"));

      goto LABEL_19;
    }
    v23 = -[SBLayoutState interfaceOrientation](finalLayoutState, "interfaceOrientation");
    v21 = -[SBMainDisplayLayoutState floatingConfiguration](self->_finalLayoutState, "floatingConfiguration");
    v20 = v12;
    v19 = v23;
  }
  objc_msgSend(v20, "frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:", v19, v21);
LABEL_19:
  v25 = objc_alloc(MEMORY[0x1E0CEA570]);
  UIRectGetCenter();
  v26 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v31[0] = *MEMORY[0x1E0C9BAA8];
  v31[1] = v26;
  v31[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v27 = (void *)objc_msgSend(v25, "initWithContainer:center:transform:", v10, v31);
  objc_msgSend(v7, "retargetedPreviewWithTarget:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "set_springboardPlatterStyle:", 1);
  return v28;
}

- (void)_handleWillAnimateDropWithAnimator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v4 = a3;
  -[SBDragAndDropWorkspaceTransaction addMilestone:](self, "addMilestone:", CFSTR("SBDragAndDropAppActivationDropAnimationMilestone"));
  -[SBWorkspaceTransaction windowScene](self, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatingDockController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissFloatingDockIfPresentedAnimated:completionHandler:", 1, 0);
  objc_msgSend(MEMORY[0x1E0DAA4C8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissAppIconForceTouchControllers:", 0);

  -[SBDragAndDropWorkspaceTransaction _iconManager](self, "_iconManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dismissIconShareSheets");

  -[SBDragAndDropWorkspaceTransaction addMilestone:](self, "addMilestone:", CFSTR("SBDragAndDropAppActivationWaitingToAddToAppsTransactionMilestone"));
  v9 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__SBDragAndDropWorkspaceTransaction__handleWillAnimateDropWithAnimator___block_invoke;
  v11[3] = &unk_1E8E9DED8;
  v11[4] = self;
  objc_msgSend(v4, "addAnimations:", v11);
  v10[0] = v9;
  v10[1] = 3221225472;
  v10[2] = __72__SBDragAndDropWorkspaceTransaction__handleWillAnimateDropWithAnimator___block_invoke_3;
  v10[3] = &unk_1E8EA2880;
  v10[4] = self;
  objc_msgSend(v4, "addCompletion:", v10);

}

void __72__SBDragAndDropWorkspaceTransaction__handleWillAnimateDropWithAnimator___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "_updatePlatterPreviewForSetDown:animated:", 1, 1);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__SBDragAndDropWorkspaceTransaction__handleWillAnimateDropWithAnimator___block_invoke_2;
  block[3] = &unk_1E8E9DED8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __72__SBDragAndDropWorkspaceTransaction__handleWillAnimateDropWithAnimator___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_runFinalLayoutStateTransaction");
  return objc_msgSend(*(id *)(a1 + 32), "removeMilestone:", CFSTR("SBDragAndDropAppActivationWaitingToAddToAppsTransactionMilestone"));
}

_QWORD *__72__SBDragAndDropWorkspaceTransaction__handleWillAnimateDropWithAnimator___block_invoke_3(uint64_t a1)
{
  id v2;
  _QWORD *result;

  if ((objc_msgSend(*(id *)(a1 + 32), "isComplete") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "_stopDelayingTransitionCompletionForRequester:", CFSTR("SBToAppsDelayTransitionCompletionForDropAnimation"));
    objc_msgSend(*(id *)(a1 + 32), "_updatePlatterViewBlurForDropCompletion");
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 408);
    objc_msgSend(v2, "dropDestinationAnimationCompleted");
    objc_msgSend(*(id *)(a1 + 32), "removeMilestone:", CFSTR("SBDragAndDropAppActivationDropAnimationMilestone"));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 337) = 1;

  }
  result = *(_QWORD **)(a1 + 32);
  if (result[39] == 10)
    return (_QWORD *)objc_msgSend(result, "_noteSwitcherDropAnimationCompletedWithContext:", result[40]);
  return result;
}

- (void)_handleSessionDidEnd:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = *MEMORY[0x1E0DABDE0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_currentDropAction);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = *MEMORY[0x1E0DABDD8];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[SBApplicationDropSession localContext](self->_dropSession, "localContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "startLocation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DA9D78];
  v10 = v8;
  objc_msgSend(v9, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "emitEvent:withPayload:", 32, v10);

  self->_sessionState = 2;
  -[SBDragAndDropWorkspaceTransaction _uncommandeerContentDrag](self, "_uncommandeerContentDrag");
  -[SBDragAndDropWorkspaceTransaction removeMilestone:](self, "removeMilestone:", CFSTR("SBDragAndDropAppActivationDraggingMilestone"));
}

- (void)_noteSwitcherDropAnimationCompletedWithContext:(id)a3
{
  SBSwitcherController **p_switcherController;
  id v4;
  id WeakRetained;

  p_switcherController = &self->_switcherController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_switcherController);
  objc_msgSend(WeakRetained, "_noteSwitcherDropAnimationCompletedWithContext:", v4);

}

- (void)_uncommandeerContentDrag
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id v8;

  -[SBApplicationDropSession uiDragDropSession](self->_dropSession, "uiDragDropSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SBApplicationDropSessionGetDragItem(v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setPreviewProvider:", 0);
  +[SBDraggingSystemManager sharedInstance](SBDraggingSystemManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationDropSession systemSession](self->_dropSession, "systemSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCommandeered:forDraggingSystemSession:forReason:", 0, v5, v7);

}

- (void)_displayLinkDidUpdate:(id)a3
{
  id v4;

  -[SBApplicationDropSession uiDragDropSession](self->_dropSession, "uiDragDropSession", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBDragAndDropWorkspaceTransaction _updateForWindowDragForSession:](self, "_updateForWindowDragForSession:");
  if (self->_windowDragEnteredPlatterZone)
    -[SBDragAndDropWorkspaceTransaction _handleSessionDidUpdate:](self, "_handleSessionDidUpdate:", v4);

}

- (void)_updateForWindowDragForSession:(id)a3
{
  id v4;
  CADisplayLink *v5;
  CADisplayLink *displayLinkForWindowDrag;
  CADisplayLink *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  int64_t windowDragPauseCounter;
  CADisplayLink *v32;
  SBWorkspaceApplicationSceneTransitionContext *v33;
  int64_t v34;
  int64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  SBWorkspaceApplicationSceneTransitionContext *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  SBApplicationSceneUpdateTransaction *v60;
  SBApplicationSceneUpdateTransaction *sceneUpdateTransactionForWindowDrag;
  void *v62;
  void *v63;
  SBMainDisplayLayoutState *v64;
  SBMainDisplayLayoutState *currentLayoutState;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  _QWORD v70[6];

  v4 = a3;
  if (self->_layoutElementForWindowDrag && !self->_windowDragEnteredPlatterZone)
  {
    if (!self->_displayLinkForWindowDrag)
    {
      objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__displayLinkDidUpdate_);
      v5 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      displayLinkForWindowDrag = self->_displayLinkForWindowDrag;
      self->_displayLinkForWindowDrag = v5;

      -[CADisplayLink setPaused:](self->_displayLinkForWindowDrag, "setPaused:", 0);
      v7 = self->_displayLinkForWindowDrag;
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADisplayLink addToRunLoop:forMode:](v7, "addToRunLoop:forMode:", v8, *MEMORY[0x1E0C99860]);

      self->_windowDragPauseCounter = 0;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
    objc_msgSend(WeakRetained, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(v4, "locationInView:", v10);
    v20 = v19;
    v22 = v21;
    objc_msgSend((id)objc_opt_class(), "prototypeSettingsContentDraggingCommandeerWidth");
    v24 = v23;
    -[SBTouchHistory averageTouchVelocityOverTimeDuration:](self->_touchHistory, "averageTouchVelocityOverTimeDuration:", 0.0416666667);
    if (BSFloatLessThanFloat()
      && ((objc_msgSend((id)objc_opt_class(), "isDragOverFullscreenRegionAtLocation:inBounds:", v20, v22, v12, v14, v16, v18) & 1) != 0|| -[SBLayoutElement layoutRole](self->_layoutElementForWindowDrag, "layoutRole") == 3&& (v25 = (void *)objc_opt_class(), objc_msgSend((id)objc_opt_class(), "_screenInsetsForUIDragDropSession:", v4), objc_msgSend(v25, "screenEdgeForDragOverSideGutterRegionsAtLocation:inBounds:totalContentDragGutterWidth:screenInsets:", v20, v22, v12, v14, v16,
             v18,
             v24,
             v26,
             v27,
             v28,
             v29))))
    {
      ++self->_windowDragPauseCounter;
    }
    else
    {
      self->_windowDragPauseCounter = 0;
    }
    v30 = SBScreenMaximumFramesPerSecond();
    if (v22 <= 150.0)
    {
      v30 = v30 * 0.05;
      windowDragPauseCounter = self->_windowDragPauseCounter;
      self->_windowDragEnteredPlatterZone = windowDragPauseCounter > (uint64_t)v30;
      if (windowDragPauseCounter <= (uint64_t)v30)
      {
LABEL_28:

        goto LABEL_29;
      }
    }
    else
    {
      self->_windowDragEnteredPlatterZone = 1;
    }
    -[CADisplayLink invalidate](self->_displayLinkForWindowDrag, "invalidate", v30);
    v32 = self->_displayLinkForWindowDrag;
    self->_displayLinkForWindowDrag = 0;

    v33 = objc_alloc_init(SBWorkspaceApplicationSceneTransitionContext);
    -[SBWorkspaceTransitionContext setAnimationDisabled:](v33, "setAnimationDisabled:", 1);
    v34 = -[SBLayoutElement layoutRole](self->_layoutElementForWindowDrag, "layoutRole");
    v35 = v34;
    v69 = v10;
    if (v34 == 1)
    {
      +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:](SBPreviousWorkspaceEntity, "entityWithPreviousLayoutRole:", 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v33, "setEntity:forLayoutRole:", v36, 1);

      +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v33, "setEntity:forLayoutRole:", v37, 2);

    }
    else
    {
      if (v34 != 2)
      {
        if (v34 == 3)
        {
          +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v33, "setEntity:forLayoutRole:", v44, 1);

          +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v33, "setEntity:forLayoutRole:", v45, 2);

        }
        else
        {
          if (v34 != 4)
          {
LABEL_25:
            -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "workspace");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "displayConfiguration");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "createRequestWithOptions:displayConfiguration:", 0, v51);
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v52, "setSource:", objc_msgSend(v49, "source"));
            objc_msgSend(v52, "setEventLabel:", CFSTR("DragAndDropAppActivation"));
            objc_msgSend(v52, "setApplicationContext:", v33);
            objc_msgSend(v52, "finalize");
            objc_storeStrong((id *)&self->super.super._transitionRequest, v52);
            -[SBWorkspaceTransaction layoutStateTransitionCoordinator](self, "layoutStateTransitionCoordinator");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "beginTransitionForWorkspaceTransaction:", self);

            v54 = SBLayoutRoleMaskAppLayout();
            if (SBLayoutRoleMaskContainsRole(v54, -[SBLayoutElement layoutRole](self->_layoutElementForWindowDrag, "layoutRole")))
            {
              objc_msgSend(v52, "applicationContext");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "layoutState");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "elementWithRole:", 1);
              v57 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v57, "workspaceEntity");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "applicationSceneEntity");
              v59 = (void *)objc_claimAutoreleasedReturnValue();

              v60 = -[SBApplicationSceneUpdateTransaction initWithApplicationSceneEntity:transitionRequest:]([SBApplicationSceneUpdateTransaction alloc], "initWithApplicationSceneEntity:transitionRequest:", v59, v52);
              sceneUpdateTransactionForWindowDrag = self->_sceneUpdateTransactionForWindowDrag;
              self->_sceneUpdateTransactionForWindowDrag = v60;

              v62 = (void *)*MEMORY[0x1E0CEB258];
              v70[0] = MEMORY[0x1E0C809B0];
              v70[1] = 3221225472;
              v70[2] = __68__SBDragAndDropWorkspaceTransaction__updateForWindowDragForSession___block_invoke;
              v70[3] = &unk_1E8E9DED8;
              v70[4] = self;
              objc_msgSend(v62, "sb_performBlockAfterCATransactionSynchronizedCommit:", v70);

            }
            objc_msgSend(v52, "applicationContext");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "layoutState");
            v64 = (SBMainDisplayLayoutState *)objc_claimAutoreleasedReturnValue();
            currentLayoutState = self->_currentLayoutState;
            self->_currentLayoutState = v64;

            v66 = objc_loadWeakRetained((id *)&self->_delegate);
            -[SBDeviceApplicationSceneHandle sceneIdentifier](self->_draggingApplicationSceneHandle, "sceneIdentifier");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "dragAndDropTransaction:didPlatterizeWindowDragWithSceneIdentifier:", self, v67);

            -[SBWorkspaceTransitionRequest applicationContext](self->super.super._transitionRequest, "applicationContext");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "performTransitionWithContext:animated:completion:", v68, 1, 0);

            v10 = v69;
            goto LABEL_28;
          }
          +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v33, "setEntity:forLayoutRole:", v46, 1);

          +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v33, "setEntity:forLayoutRole:", v47, 2);

          +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v33, "setEntity:forLayoutRole:", v48, 3);

        }
        +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v33;
        v43 = v40;
        v41 = v35;
LABEL_24:
        -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v42, "setEntity:forLayoutRole:", v43, v41);

        goto LABEL_25;
      }
      +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v33, "setEntity:forLayoutRole:", v38, 1);

      +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v33, "setEntity:forLayoutRole:", v39, 2);

    }
    +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 3;
    v42 = v33;
    v43 = v40;
    goto LABEL_24;
  }
LABEL_29:

}

uint64_t __68__SBDragAndDropWorkspaceTransaction__updateForWindowDragForSession___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addChildTransaction:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 376));
}

- (void)_updatePlatterViewBlurForDropCompletion
{
  SBAppPlatterDragPreview *v3;
  SBAppPlatterDragSourceViewProviding *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v3 = self->_activePlatterPreview;
  v4 = self->_activeSourceViewProvider;
  if (v4
    && (-[SBAppPlatterDragPreview mode](v3, "mode") != 2
     || -[SBAppPlatterDragPreview isAnimatingPlatterViewAlpha](v3, "isAnimatingPlatterViewAlpha")))
  {
    -[SBDragAndDropWorkspaceTransaction addMilestone:](self, "addMilestone:", CFSTR("SBDragAndDropAppActivationPlatterFadeOutMilestone"));
    -[SBAppPlatterDragSourceViewProviding containerViewForBlurContentView](v4, "containerViewForBlurContentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppPlatterDragPreview platterView](v3, "platterView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "iconView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 0);

    objc_msgSend(v6, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setZPosition:", 1.79769313e308);

    objc_msgSend(v5, "addSubview:", v6);
    objc_msgSend(v5, "bounds");
    objc_msgSend(v6, "setBounds:");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __76__SBDragAndDropWorkspaceTransaction__updatePlatterViewBlurForDropCompletion__block_invoke;
    v11[3] = &unk_1E8E9E820;
    v11[4] = self;
    v12 = v6;
    v10 = v6;
    -[SBAppPlatterDragPreview setPlatterViewAlphaAnimationCompletionBlock:](v3, "setPlatterViewAlphaAnimationCompletionBlock:", v11);

  }
}

uint64_t __76__SBDragAndDropWorkspaceTransaction__updatePlatterViewBlurForDropCompletion__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeMilestone:", CFSTR("SBDragAndDropAppActivationPlatterFadeOutMilestone"));
  return objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
}

- (double)_platterScale
{
  double v3;
  double v4;
  void *v5;
  BOOL v6;
  double v7;
  int64_t currentDropAction;
  double v9;
  void *v10;
  int v11;
  double result;

  -[SBMedusaSettings iconPlatterScale](self->_medusaSettings, "iconPlatterScale");
  v4 = v3;
  -[SBApplicationDropSession localContext](self->_dropSession, "localContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "startLocation") == 8)
  {

  }
  else
  {
    v6 = -[SBApplicationDropSession isWindowTearOff](self->_dropSession, "isWindowTearOff");

    if (!v6)
    {
      currentDropAction = self->_currentDropAction;
      goto LABEL_9;
    }
  }
  if (!self->_currentDropAction)
    goto LABEL_11;
  -[SBMedusaSettings windowPlatterScale](self->_medusaSettings, "windowPlatterScale");
  currentDropAction = self->_currentDropAction;
  if (currentDropAction == 1)
    v4 = 0.6;
  else
    v4 = v7;
LABEL_9:
  if (currentDropAction == 10)
  {
    -[SBDragAndDropWorkspaceTransaction _platterScaleForSwitcherDropContext:](self, "_platterScaleForSwitcherDropContext:", self->_currentSwitcherDropRegionContext);
    v4 = v9;
  }
LABEL_11:
  +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isiPadMini");

  result = v4 / 0.9;
  if (!v11)
    return v4;
  return result;
}

- (double)_platterScaleForSwitcherDropContext:(id)a3
{
  SBMedusaSettings *medusaSettings;
  id v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double result;

  medusaSettings = self->_medusaSettings;
  v5 = a3;
  -[SBMedusaSettings cardPlatterScale](medusaSettings, "cardPlatterScale");
  v7 = v6;
  objc_msgSend(v5, "draggingLeafAppLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "environment");

  v10 = objc_msgSend(v5, "currentDropRegion");
  objc_msgSend(v5, "intersectingAppLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "environment");
  if (v9 == 2)
    v13 = v10;
  else
    v13 = v12;
  if (v13 != 2)
    return v7;
  -[SBMedusaSettings floatingCardPlatterScale](self->_medusaSettings, "floatingCardPlatterScale");
  return result;
}

- (CGSize)_platterSizeForDropAction:(int64_t)a3 proposedDropLayoutState:(id)a4 setDown:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  int v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t *v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGSize result;

  v5 = a5;
  v8 = a4;
  -[SBWorkspaceTransaction windowScene](self, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "switcherController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "isChamoisWindowingUIEnabled");
  v12 = *MEMORY[0x1E0C9D820];
  v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v11)
  {
    if ((unint64_t)(a3 - 1) >= 5)
    {
      if (a3 == 10)
      {
LABEL_7:
        -[SBDragAndDropWorkspaceTransaction _platterSizeForSwitcherDropContext:setDown:](self, "_platterSizeForSwitcherDropContext:setDown:", self->_currentSwitcherDropRegionContext, v5);
        v12 = v19;
        v13 = v20;
      }
    }
    else
    {
      objc_msgSend(v8, "appLayout");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "frameForItemWithRole:inMainAppLayout:interfaceOrientation:", 1, v14, objc_msgSend(v8, "interfaceOrientation"));
      v12 = v15;
      v13 = v16;

    }
  }
  else
  {
    switch(a3)
    {
      case 1:
      case 2:
      case 4:
        v21 = &SBLayoutRolePrimary;
        goto LABEL_10;
      case 3:
      case 5:
        v21 = &SBLayoutRoleSide;
LABEL_10:
        v22 = *v21;
        objc_msgSend(v8, "appLayout");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "frameForItemWithRole:inMainAppLayout:interfaceOrientation:", v22, v23, objc_msgSend(v8, "interfaceOrientation"));
        v12 = v24;
        v13 = v25;

        break;
      case 6:
      case 7:
      case 8:
      case 9:
        objc_msgSend(v10, "frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:", objc_msgSend(v8, "interfaceOrientation"), objc_msgSend(v8, "floatingConfiguration"));
        v12 = v17;
        v13 = v18;
        break;
      case 10:
        goto LABEL_7;
      default:
        break;
    }
  }
  if (!v5)
  {
    -[SBDragAndDropWorkspaceTransaction _platterScale](self, "_platterScale");
    v13 = v13 * v26;
    v12 = v12 * v26;
  }

  v27 = v12;
  v28 = v13;
  result.height = v28;
  result.width = v27;
  return result;
}

- (CGSize)_platterSizeForSwitcherDropContext:(id)a3 setDown:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id WeakRetained;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _QWORD v25[4];
  id v26;
  CGSize result;

  v4 = a4;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  objc_msgSend(v6, "draggingLeafAppLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "currentDropRegion");
  v10 = objc_msgSend(v6, "currentDropAction");
  if (v4)
  {
    objc_msgSend(WeakRetained, "appLayouts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __80__SBDragAndDropWorkspaceTransaction__platterSizeForSwitcherDropContext_setDown___block_invoke;
    v25[3] = &unk_1E8E9DF78;
    v26 = v8;
    objc_msgSend(v11, "bs_firstObjectPassingTest:", v25);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[SBWorkspaceTransaction windowScene](self, "windowScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "switcherController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(WeakRetained, "switcherInterfaceOrientation");
  if (objc_msgSend(v8, "environment") == 1 || v10 == 3)
  {
    objc_msgSend(v13, "frameForItemWithRole:inMainAppLayout:interfaceOrientation:", 1, v8, v14);
    goto LABEL_8;
  }
  if (objc_msgSend(v8, "environment") == 2)
  {
    objc_msgSend(v13, "frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:", v14, 2);
LABEL_8:
    v17 = v15;
    v18 = v16;
    goto LABEL_10;
  }
  v17 = *MEMORY[0x1E0C9D820];
  v18 = *(double *)(MEMORY[0x1E0C9D820] + 8);
LABEL_10:
  if (v9 <= 7)
  {
    if (((1 << v9) & 0x8D) != 0)
    {
      if (v10 == 3)
      {
        objc_msgSend(v6, "targetRect");
        v17 = v19;
        v18 = v20;
        goto LABEL_19;
      }
      -[SBAppPlatterDragPreview sourceViewScale](self->_activePlatterPreview, "sourceViewScale");
      SBTransformedSizeWithScale();
    }
    else if (((1 << v9) & 0x70) != 0)
    {
      objc_msgSend(v6, "scaledIntersectingAppLayoutSize");
    }
    else
    {
      -[SBAppPlatterDragPreview size](self->_activePlatterPreview, "size");
    }
    v17 = v21;
    v18 = v22;
  }
LABEL_19:

  v23 = v17;
  v24 = v18;
  result.height = v24;
  result.width = v23;
  return result;
}

uint64_t __80__SBDragAndDropWorkspaceTransaction__platterSizeForSwitcherDropContext_setDown___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "itemForLayoutRole:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "containsItemWithUniqueIdentifier:", v5);

  return v6;
}

- (double)_platterSourceViewScaleForSetDropAction:(int64_t)a3 setDown:(BOOL)a4
{
  _BOOL4 v4;
  double result;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  _QWORD v15[4];
  id v16;

  v4 = a4;
  -[SBAppPlatterDragPreview sourceViewScale](self->_activePlatterPreview, "sourceViewScale");
  if (v4)
  {
    result = 1.0;
    if (a3 == 10)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
      -[SBDeviceApplicationSceneHandle sceneIdentifier](self->_draggingApplicationSceneHandle, "sceneIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "appLayouts");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __85__SBDragAndDropWorkspaceTransaction__platterSourceViewScaleForSetDropAction_setDown___block_invoke;
      v15[3] = &unk_1E8E9DF78;
      v16 = v9;
      v11 = v9;
      objc_msgSend(v10, "bs_firstObjectPassingTest:", v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained, "contentPageViewScaleForAppLayout:", v12);
      v14 = v13;

      return v14;
    }
  }
  return result;
}

uint64_t __85__SBDragAndDropWorkspaceTransaction__platterSourceViewScaleForSetDropAction_setDown___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsItemWithUniqueIdentifier:", *(_QWORD *)(a1 + 32));
}

- (id)_cornerRadiusConfigurationForDropAction:(int64_t)a3 proposedDropLayoutState:(id)a4 setDown:(BOOL)a5 mode:(unint64_t)a6
{
  _BOOL4 v7;
  id v10;
  double v11;
  id v12;
  double v13;
  int64_t v14;
  int64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  SBAppPlatterDragSourceViewProviding *activeSourceViewProvider;
  _BYTE v29[8];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v7 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  if (a6 != 2 && !v7)
  {
    v11 = 0.0;
    if ((unint64_t)(a3 - 1) <= 9)
      v11 = dbl_1D0E89E20[a3 - 1];
    v12 = objc_alloc(MEMORY[0x1E0D01730]);
    v13 = v11;
    goto LABEL_10;
  }
  v14 = -[SBDragAndDropWorkspaceTransaction _layoutRoleForDropAction:](self, "_layoutRoleForDropAction:", a3);
  v15 = v14;
  if (a6 == 2 && !self->_layoutElementForWindowDrag)
  {
    activeSourceViewProvider = self->_activeSourceViewProvider;
    if (activeSourceViewProvider)
    {
      -[SBAppPlatterDragSourceViewProviding initialCornerRadiusConfiguration](activeSourceViewProvider, "initialCornerRadiusConfiguration", v15);
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    v12 = objc_alloc(MEMORY[0x1E0D01730]);
    v13 = 10.0;
LABEL_10:
    v17 = objc_msgSend(v12, "initWithCornerRadius:", v13);
LABEL_11:
    v18 = (void *)v17;
    goto LABEL_12;
  }
  if (v14 == 3)
  {
    v16 = objc_alloc(MEMORY[0x1E0D01730]);
    -[SBMedusaSettings cornerRadiusForFloatingApps](self->_medusaSettings, "cornerRadiusForFloatingApps");
    v12 = v16;
    goto LABEL_10;
  }
  objc_msgSend(v10, "elementWithRole:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  SBDefaultCornerRadiusConfigurationForElementInLayoutState(v20, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (a6 == 2 && !v7)
  {
    objc_msgSend(v18, "topLeft");
    v22 = v21;
    objc_msgSend(v18, "topRight");
    v30 = v23;
    objc_msgSend(v18, "bottomLeft");
    v31 = v24;
    objc_msgSend(v18, "bottomRight");
    v32 = v25;
    for (i = 8; i != 32; i += 8)
    {
      if (v22 < *(double *)&v29[i])
        v22 = *(double *)&v29[i];
    }
    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01730]), "initWithCornerRadius:", v22);

    v18 = (void *)v27;
  }
LABEL_12:

  return v18;
}

- (id)_cornerRadiusForSwitcherDragContext:(id)a3 setDown:(BOOL)a4 sourceViewScale:(double)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id WeakRetained;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;

  v6 = a4;
  v8 = a3;
  v9 = v8;
  if (v6)
  {
    objc_msgSend(v8, "finalTargetAppLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "draggingLeafAppLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "itemForLayoutRole:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "layoutRoleForItem:", v12);

  }
  else
  {
    objc_msgSend(v8, "draggingAppLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 1;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  objc_msgSend(WeakRetained, "cornerRadiiForLayoutRole:inAppLayout:", v13, v10);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01730]), "initWithTopLeft:bottomLeft:bottomRight:topRight:", v16 * a5, v18 * a5, v20 * a5, v22 * a5);
  return v23;
}

- (void)_getPlatterDiffuseShadowParameters:(SBDragPreviewShadowParameters *)a3 rimShadowParameters:(SBDragPreviewShadowParameters *)a4 diffuseFilters:(id *)a5 rimFilters:(id *)a6 forDropAction:(int64_t)a7 setDown:(BOOL)a8 mode:(unint64_t)a9 userInterfaceStyle:(int64_t)a10
{
  SBAppPlatterDragSourceViewProviding *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  void *v34;
  void *v35;
  double v36;
  int64_t v37;
  double v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat *v44;
  void *v45;
  void *v46;
  SBMedusaSettings *medusaSettings;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  _OWORD v54[5];
  void *v55;
  _QWORD v56[3];

  v56[1] = *MEMORY[0x1E0C80C00];
  if (a9 == 2)
  {
    if (!self->_layoutElementForWindowDrag)
    {
      v17 = self->_activeSourceViewProvider;
      -[SBAppPlatterDragSourceViewProviding initialDiffuseShadowParameters](v17, "initialDiffuseShadowParameters");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;
      -[SBAppPlatterDragSourceViewProviding initialRimShadowParameters](v17, "initialRimShadowParameters");
      v27 = v26;
      v29 = v28;
      v31 = v30;
      v33 = v32;
      -[SBAppPlatterDragSourceViewProviding initialDiffuseShadowFilters](v17, "initialDiffuseShadowFilters");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBAppPlatterDragSourceViewProviding initialRimShadowFilters](v17, "initialRimShadowFilters");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:

      goto LABEL_28;
    }
LABEL_5:
    v17 = self->_medusaSettings;
    if (-[SBDragAndDropWorkspaceTransaction _layoutRoleForDropAction:](self, "_layoutRoleForDropAction:", a7) == 3)
    {
      if (a10 == 2)
        -[SBAppPlatterDragSourceViewProviding coronaDiffuseShadowOpacity](v17, "coronaDiffuseShadowOpacity");
      else
        -[SBAppPlatterDragSourceViewProviding diffuseShadowOpacity](v17, "diffuseShadowOpacity");
      v19 = v36;
      -[SBAppPlatterDragSourceViewProviding diffuseShadowRadius](v17, "diffuseShadowRadius");
      v21 = v38;
      v39 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
      -[SBAppPlatterDragSourceViewProviding diffuseShadowOffsetHorizontal](v17, "diffuseShadowOffsetHorizontal");
      if (v39 == 1)
        v40 = -v40;
      if (self->_currentDropAction == 6)
        v23 = -v40;
      else
        v23 = v40;
      -[SBAppPlatterDragSourceViewProviding diffuseShadowOffsetVertical](v17, "diffuseShadowOffsetVertical");
      v25 = v41;
      if (a10 == 2)
      {
        -[SBAppPlatterDragSourceViewProviding coronaRimShadowOpacity](v17, "coronaRimShadowOpacity");
        v27 = v42;
        -[SBAppPlatterDragSourceViewProviding rimShadowRadius](v17, "rimShadowRadius");
        v29 = v43;
        v44 = (CGFloat *)MEMORY[0x1E0C9D820];
        objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F08]);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (void *)MEMORY[0x1E0CB3B18];
        medusaSettings = self->_medusaSettings;
        if (medusaSettings)
          -[SBMedusaSettings coronaVibrantColorMatrixInput](medusaSettings, "coronaVibrantColorMatrixInput");
        else
          memset(v54, 0, sizeof(v54));
        v31 = *v44;
        v33 = v44[1];
        objc_msgSend(v46, "valueWithCAColorMatrix:", v54);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setValue:forKey:", v53, CFSTR("inputColorMatrix"));

        v56[0] = v45;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v45;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_27;
      }
    }
    else
    {
      v23 = 0.0;
      if (a9 != 2 || a8)
      {
        v35 = 0;
        v34 = 0;
        v33 = 0.0;
        v31 = 0.0;
        v29 = 0.0;
        v27 = 0.0;
        v25 = 0.0;
        v21 = 0.0;
        v19 = 0.0;
        goto LABEL_27;
      }
      -[SBAppPlatterDragSourceViewProviding diffuseShadowOpacity](v17, "diffuseShadowOpacity");
      v19 = v48;
      -[SBAppPlatterDragSourceViewProviding diffuseShadowRadius](v17, "diffuseShadowRadius");
      v21 = v49;
      -[SBAppPlatterDragSourceViewProviding diffuseShadowOffsetVertical](v17, "diffuseShadowOffsetVertical");
      v25 = v50;
    }
    -[SBAppPlatterDragSourceViewProviding rimShadowOpacity](v17, "rimShadowOpacity");
    v27 = v51;
    -[SBAppPlatterDragSourceViewProviding rimShadowRadius](v17, "rimShadowRadius");
    v29 = v52;
    v35 = 0;
    v34 = 0;
    v31 = *MEMORY[0x1E0C9D820];
    v33 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    goto LABEL_27;
  }
  if (a8)
    goto LABEL_5;
  v37 = a7 - 1;
  v33 = 0.0;
  v35 = 0;
  v34 = 0;
  if ((unint64_t)(a7 - 1) > 9)
  {
    v31 = 0.0;
    v29 = 0.0;
    v27 = 0.0;
    v25 = 0.0;
    v23 = 0.0;
    v21 = 0.0;
    v19 = 0.0;
  }
  else
  {
    v25 = dbl_1D0E89E70[v37];
    v21 = dbl_1D0E89EC0[v37];
    v19 = 0.25;
    v31 = 0.0;
    v29 = 0.0;
    v27 = 0.0;
    v23 = 0.0;
  }
LABEL_28:
  if (a3)
  {
    a3->shadowOpacity = v19;
    a3->shadowRadius = v21;
    a3->shadowOffset.width = v23;
    a3->shadowOffset.height = v25;
  }
  if (a4)
  {
    a4->shadowOpacity = v27;
    a4->shadowRadius = v29;
    a4->shadowOffset.width = v31;
    a4->shadowOffset.height = v33;
  }
  if (a5)
    *a5 = objc_retainAutorelease(v34);
  if (a6)
    *a6 = objc_retainAutorelease(v35);

}

- (void)_updatePlatterPreviewForSetDown:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  SBAppPlatterDragPreview *v7;
  int64_t currentDropAction;
  SBMainDisplayLayoutState *v9;
  uint64_t v10;
  id WeakRetained;
  int64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  SBMainDisplayLayoutState *v19;
  SBSwitcherDropRegionContext *currentSwitcherDropRegionContext;
  SBAppPlatterDragPreview *v21;
  SBMainDisplayLayoutState *v22;
  SBMainDisplayLayoutState *finalLayoutState;
  SBMainDisplayLayoutState *v24;
  id v25;
  void *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  SBDeviceApplicationSceneHandle *draggingApplicationSceneHandle;
  double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  double v43;
  int64_t v44;
  int64_t v45;
  double v46;
  double v47;
  uint64_t v48;
  SBAppPlatterDragPreview *v49;
  id v50;
  id v51;
  id v52;
  void (**v53)(_QWORD);
  void (**v54)(_QWORD, _QWORD, _QWORD);
  void *v55;
  void *v56;
  void *v57;
  int64_t v58;
  uint64_t v59;
  SBMainDisplayLayoutState *v60;
  _BOOL4 v61;
  _QWORD v62[5];
  _QWORD v63[5];
  SBAppPlatterDragPreview *v64;
  id v65;
  id v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  double v71;
  double v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  id v78;
  id v79;
  __int128 v80;
  __int128 v81;
  id location[2];
  __int128 v83;
  _QWORD v84[4];
  id v85;
  BOOL v86;

  v4 = a4;
  v5 = a3;
  if ((-[SBDragAndDropWorkspaceTransaction isInterrupted](self, "isInterrupted") & 1) != 0)
    return;
  v7 = self->_activePlatterPreview;
  currentDropAction = self->_currentDropAction;
  v9 = self->_currentDropActionProposedLayoutState;
  v10 = !self->_draggingExistingItemFromActiveLayoutState;
  if (self->_dragExitedDropZone)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
    if (objc_msgSend(WeakRetained, "isChamoisWindowingUIEnabled"))
    {
      v12 = -[SBApplicationDropSession dropZones](self->_dropSession, "dropZones");

      if (!v12)
      {
        v10 = 0;
        goto LABEL_13;
      }
    }
    else
    {

    }
LABEL_12:
    v10 = 2;
    goto LABEL_13;
  }
  if (self->_layoutElementForWindowDrag && !self->_windowDragEnteredPlatterZone)
    goto LABEL_12;
  if (!currentDropAction)
  {
    -[SBApplicationDropSession localContext](self->_dropSession, "localContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "startLocation");

    if (v14 == 8)
    {
      v15 = 7;
      -[SBDragAndDropWorkspaceTransaction _transitionRequestForDropAction:](self, "_transitionRequestForDropAction:", 7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "finalize");
      objc_msgSend(v16, "applicationContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "layoutState");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v9;
      v9 = (SBMainDisplayLayoutState *)v18;

      currentDropAction = 0;
      v10 = 1;
    }
    else
    {
      -[SBAppPlatterDragPreview sourceView](v7, "sourceView");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v57 != 0;

      v15 = 0;
    }
    goto LABEL_14;
  }
LABEL_13:
  v15 = currentDropAction;
LABEL_14:
  currentSwitcherDropRegionContext = self->_currentSwitcherDropRegionContext;
  if (currentSwitcherDropRegionContext)
  {
    if (-[SBSwitcherDropRegionContext currentDropRegion](currentSwitcherDropRegionContext, "currentDropRegion") == 1)
    {
      v10 = 2;
    }
    else if (-[SBSwitcherDropRegionContext isSwap](self->_currentSwitcherDropRegionContext, "isSwap"))
    {
      v10 = 2;
    }
    else
    {
      v10 = 1;
    }
  }
  v61 = v4;
  if (self->_sessionState == 2)
  {
    v59 = v15;
    v58 = currentDropAction;
    v21 = v7;
    v22 = v9;
    finalLayoutState = self->_finalLayoutState;
    if (!finalLayoutState)
      finalLayoutState = self->_currentLayoutState;
    v24 = finalLayoutState;
    v25 = objc_loadWeakRetained((id *)&self->_switcherContentController);
    -[SBMainDisplayLayoutState appLayout](v24, "appLayout");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "_isAppLayoutBlurred:", v26);

    if (self->_layoutStateTransitionCompleted || self->_currentWorkspaceTransaction)
    {
      v28 = -[NSMutableSet count](self->_pendingSceneUpdatesTransactions, "count");
      v29 = 2;
      if (v27)
        v29 = v10;
      if (!v28)
        v10 = v29;
    }
    v9 = v22;
    v7 = v21;

    currentDropAction = v58;
    v15 = v59;
  }
  if (v10 == 1)
  {
    -[SBAppPlatterDragPreview platterView](v7, "platterView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
    {
      objc_initWeak(location, self);
      draggingApplicationSceneHandle = self->_draggingApplicationSceneHandle;
      v84[0] = MEMORY[0x1E0C809B0];
      v84[1] = 3221225472;
      v84[2] = __78__SBDragAndDropWorkspaceTransaction__updatePlatterPreviewForSetDown_animated___block_invoke;
      v84[3] = &unk_1E8EA8690;
      objc_copyWeak(&v85, location);
      v86 = v5;
      -[SBDragAndDropWorkspaceTransaction _configurePlatterPreview:forSceneHandle:completion:](self, "_configurePlatterPreview:forSceneHandle:completion:", v7, draggingApplicationSceneHandle, v84);
      objc_destroyWeak(&v85);
      objc_destroyWeak(location);
    }
  }
  -[SBDragAndDropWorkspaceTransaction _platterSourceViewScaleForSetDropAction:setDown:](self, "_platterSourceViewScaleForSetDropAction:setDown:", currentDropAction, v5);
  v33 = v32;
  -[SBDragAndDropWorkspaceTransaction _platterSizeForDropAction:proposedDropLayoutState:setDown:](self, "_platterSizeForDropAction:proposedDropLayoutState:setDown:", v15, v9, v5);
  v35 = v34;
  v37 = v36;
  if (self->_currentDropAction == 10)
    -[SBDragAndDropWorkspaceTransaction _cornerRadiusForSwitcherDragContext:setDown:sourceViewScale:](self, "_cornerRadiusForSwitcherDragContext:setDown:sourceViewScale:", self->_currentSwitcherDropRegionContext, v5, v33);
  else
    -[SBDragAndDropWorkspaceTransaction _cornerRadiusConfigurationForDropAction:proposedDropLayoutState:setDown:mode:](self, "_cornerRadiusConfigurationForDropAction:proposedDropLayoutState:setDown:mode:", v15, v9, v5, v10);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)location = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v78 = 0;
  v79 = 0;
  -[SBAppPlatterDragPreview traitCollection](v7, "traitCollection");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDragAndDropWorkspaceTransaction _getPlatterDiffuseShadowParameters:rimShadowParameters:diffuseFilters:rimFilters:forDropAction:setDown:mode:userInterfaceStyle:](self, "_getPlatterDiffuseShadowParameters:rimShadowParameters:diffuseFilters:rimFilters:forDropAction:setDown:mode:userInterfaceStyle:", location, &v80, &v79, &v78, v15, v5, v10, objc_msgSend(v39, "userInterfaceStyle"));
  v40 = v79;
  v41 = v78;

  if (v5)
  {
    v42 = 3;
  }
  else if (self->_layoutElementForWindowDrag)
  {
    if (self->_windowLiftAnimationCompleted)
      v42 = 2;
    else
      v42 = 1;
  }
  else
  {
    v42 = 2;
  }
  v60 = v9;
  -[SBDragAndDropWorkspaceTransaction _updateActiveSourceViewProviderWithDragState:](self, "_updateActiveSourceViewProviderWithDragState:", v42);
  v43 = 0.0;
  if (self->_finalLayoutState)
  {
    v44 = -[SBLayoutState interfaceOrientation](self->_currentLayoutState, "interfaceOrientation");
    v45 = -[SBLayoutState interfaceOrientation](self->_finalLayoutState, "interfaceOrientation");
    if (v44 != v45)
    {
      v46 = 0.0;
      v47 = 0.0;
      if (v45 != 1)
      {
        if (v45 == 3)
        {
          v47 = 1.57079633;
        }
        else if (v45 == 4)
        {
          v47 = -1.57079633;
        }
        else
        {
          v47 = 3.14159265;
          if (v45 != 2)
            v47 = 0.0;
        }
      }
      if (v44 != 1)
      {
        if (v44 == 3)
        {
          v46 = 1.57079633;
        }
        else if (v44 == 4)
        {
          v46 = -1.57079633;
        }
        else
        {
          v46 = 3.14159265;
          if (v44 != 2)
            v46 = 0.0;
        }
      }
      v43 = v47 - v46;
    }
  }
  v48 = MEMORY[0x1E0C809B0];
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __78__SBDragAndDropWorkspaceTransaction__updatePlatterPreviewForSetDown_animated___block_invoke_2;
  v63[3] = &unk_1E8EB21C8;
  v63[4] = self;
  v49 = v7;
  v64 = v49;
  v68 = v10;
  v69 = v35;
  v70 = v37;
  v71 = v33;
  v72 = v43;
  v50 = v38;
  v65 = v50;
  v73 = *(_OWORD *)location;
  v74 = v83;
  v75 = v80;
  v76 = v81;
  v51 = v40;
  v66 = v51;
  v52 = v41;
  v67 = v52;
  v77 = v42;
  v53 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v63);
  v62[0] = v48;
  v62[1] = 3221225472;
  v62[2] = __78__SBDragAndDropWorkspaceTransaction__updatePlatterPreviewForSetDown_animated___block_invoke_3;
  v62[3] = &unk_1E8EA46E8;
  v62[4] = self;
  v54 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](v62);
  if (v61)
  {
    v55 = (void *)MEMORY[0x1E0CEABB0];
    -[SBMedusaSettings platterAnimationSettings](self->_medusaSettings, "platterAnimationSettings");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "_animateUsingSpringBehavior:tracking:animations:completion:", v56, 0, v53, v54);

  }
  else
  {
    v53[2](v53);
    v54[2](v54, 1, 0);
  }

}

void __78__SBDragAndDropWorkspaceTransaction__updatePlatterPreviewForSetDown_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v4 = objc_msgSend(WeakRetained, "isInterrupted");
    v3 = v5;
    if ((v4 & 1) == 0)
    {
      objc_msgSend(v5, "_updatePlatterPreviewForSetDown:animated:", *(unsigned __int8 *)(a1 + 40), 1);
      v3 = v5;
    }
  }

}

uint64_t __78__SBDragAndDropWorkspaceTransaction__updatePlatterPreviewForSetDown_animated___block_invoke_2(uint64_t a1)
{
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 440);
  objc_msgSend(*(id *)(a1 + 40), "setMode:", *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 40), "setPlatterSize:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 40), "setSourceViewScale:", *(double *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 40), "setRotation:", *(double *)(a1 + 104));
  objc_msgSend(*(id *)(a1 + 40), "setCornerRadiusConfiguration:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "setDiffuseShadowParameters:", *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128), *(double *)(a1 + 136));
  objc_msgSend(*(id *)(a1 + 40), "setRimShadowParameters:", *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160), *(double *)(a1 + 168));
  objc_msgSend(*(id *)(a1 + 40), "setDiffuseShadowFilters:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "setRimShadowFilters:", *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 40), "setDragState:", *(_QWORD *)(a1 + 176));
  return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
}

uint64_t __78__SBDragAndDropWorkspaceTransaction__updatePlatterPreviewForSetDown_animated___block_invoke_3(uint64_t a1)
{
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 440);
  return objc_msgSend(*(id *)(a1 + 32), "_interruptForDragExitedDropZoneIfNecessary");
}

- (void)_updatePlatterPreviewWithUpdatedSourceView
{
  id WeakRetained;
  int64_t currentDropAction;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SBAppPlatterDragSourceViewProviding *activeSourceViewProvider;
  SBAppPlatterDragSourceViewProviding *v19;
  id v20;
  unint64_t v21;
  SBAppPlatterDragPreview *v22;

  v22 = self->_activePlatterPreview;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  currentDropAction = self->_currentDropAction;
  if ((unint64_t)(currentDropAction - 8) < 2)
  {
    -[SBAppPlatterDragPreview sourceView](v22, "sourceView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_removeAllRetargetableAnimations:", 1);

    goto LABEL_17;
  }
  if (currentDropAction == 10)
    goto LABEL_17;
  if (self->_draggingExistingItemFromActiveLayoutState)
  {
    -[SBAppPlatterDragPreview dropDestinationAnimationCompleted](self->_activePlatterPreview, "dropDestinationAnimationCompleted");
    goto LABEL_17;
  }
  v7 = -[SBDragAndDropWorkspaceTransaction _layoutRoleForDropAction:](self, "_layoutRoleForDropAction:");
  if (v7)
  {
    v11 = v7;
    if (SBLayoutRoleIsValidForSplitView(v7))
    {
      -[SBMainDisplayLayoutState appLayout](self->_finalLayoutState, "appLayout");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "leafAppLayoutForRole:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained, "visibleItemContainers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = v13;
    }
    else
    {
      if (v11 != 3)
        goto LABEL_8;
      objc_msgSend(WeakRetained, "visibleItemContainers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBMainDisplayLayoutState floatingAppLayout](self->_finalLayoutState, "floatingAppLayout");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v16 = v15;
    }
    objc_msgSend(v14, "objectForKey:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      goto LABEL_14;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDragAndDropWorkspaceTransaction.m"), 1743, CFSTR("Invalid role."));

LABEL_8:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDragAndDropWorkspaceTransaction.m"), 1750, CFSTR("No source view!"));

  v10 = 0;
LABEL_14:
  objc_msgSend(v10, "sourceView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppPlatterDragPreview updateSourceView:](v22, "updateSourceView:", v17);

  activeSourceViewProvider = self->_activeSourceViewProvider;
  if (activeSourceViewProvider)
    -[SBAppPlatterDragSourceViewProviding setDragging:](activeSourceViewProvider, "setDragging:", 0);
  v19 = self->_activeSourceViewProvider;
  self->_activeSourceViewProvider = (SBAppPlatterDragSourceViewProviding *)v10;
  v20 = v10;

  v21 = -[SBAppPlatterDragPreview dragState](self->_activePlatterPreview, "dragState");
  -[SBDragAndDropWorkspaceTransaction _updateActiveSourceViewProviderWithDragState:](self, "_updateActiveSourceViewProviderWithDragState:", v21);
LABEL_17:

}

- (void)_updateActiveSourceViewProviderWithDragState:(unint64_t)a3
{
  SBAppPlatterDragSourceViewProviding *activeSourceViewProvider;

  activeSourceViewProvider = self->_activeSourceViewProvider;
  if (activeSourceViewProvider)
    -[SBAppPlatterDragSourceViewProviding setDragging:](activeSourceViewProvider, "setDragging:", a3 > 1);
}

- (void)_runFinalLayoutStateTransaction
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBDragAndDropWorkspaceTransaction.m");
  v16 = 1024;
  v17 = 1799;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

- (BOOL)_shouldFailLayoutStateTransitionForWindowDrag
{
  return -[SBLayoutElement layoutRole](self->_layoutElementForWindowDrag, "layoutRole") == 3;
}

- (void)_addChildWorkspaceTransaction:(id)a3
{
  SBToAppsWorkspaceTransaction *v4;
  SBToAppsWorkspaceTransaction *v5;
  void *v6;
  NSObject *v7;
  SBToAppsWorkspaceTransaction *currentWorkspaceTransaction;
  SBToAppsWorkspaceTransaction *v9;

  v4 = (SBToAppsWorkspaceTransaction *)a3;
  v5 = self->_currentWorkspaceTransaction;
  if (v5)
  {
    -[SBWorkspaceTransaction transitionRequest](v4, "transitionRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWorkspaceTransaction interruptForTransitionRequest:](v5, "interruptForTransitionRequest:", v6);

  }
  SBLogMedusaDropDestination();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[SBDragAndDropWorkspaceTransaction _addChildWorkspaceTransaction:].cold.1((uint64_t)v4, v7);

  currentWorkspaceTransaction = self->_currentWorkspaceTransaction;
  self->_currentWorkspaceTransaction = v4;
  v9 = v4;

  -[SBDragAndDropWorkspaceTransaction addChildTransaction:](self, "addChildTransaction:", v9);
}

- (id)_currentGestureEventForGesture:(id)a3
{
  uint64_t v4;
  id WeakRetained;
  void *v6;
  void *v7;
  SBDragAndDropGestureSwitcherModifierEvent *v8;
  NSUUID *gestureID;
  void *v10;
  SBDragAndDropGestureSwitcherModifierEvent *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = SBGestureModifierPhaseForGestureState(objc_msgSend(a3, "state"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  objc_msgSend(WeakRetained, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBApplicationDropSession uiDragDropSession](self->_dropSession, "uiDragDropSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [SBDragAndDropGestureSwitcherModifierEvent alloc];
  gestureID = self->_gestureID;
  -[SBFluidSwitcherGesture selectedAppLayout](self->_dragAndDropGesture, "selectedAppLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SBGestureSwitcherModifierEvent initWithGestureID:selectedAppLayout:gestureType:phase:](v8, "initWithGestureID:selectedAppLayout:gestureType:phase:", gestureID, v10, 6, v4);

  objc_msgSend(v7, "locationInView:", v6);
  -[SBGestureSwitcherModifierEvent setLocationInContainerView:](v11, "setLocationInContainerView:");
  -[SBTouchHistory averageTouchVelocityOverTimeDuration:](self->_touchHistory, "averageTouchVelocityOverTimeDuration:", 0.0166666667);
  -[SBGestureSwitcherModifierEvent setVelocityInContainerView:](v11, "setVelocityInContainerView:");
  -[SBGestureSwitcherModifierEvent setTouchHistoryProvider:](v11, "setTouchHistoryProvider:", self->_touchHistory);
  -[SBDragAndDropGestureSwitcherModifierEvent setDropAction:](v11, "setDropAction:", self->_currentDropAction);
  -[SBDeviceApplicationSceneHandle sceneIdentifier](self->_draggingApplicationSceneHandle, "sceneIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDragAndDropGestureSwitcherModifierEvent setDraggedSceneIdentifier:](v11, "setDraggedSceneIdentifier:", v12);

  if (self->_currentSwitcherDropRegionContext)
    v13 = -[SBFluidSwitcherGesture selectedLayoutRole](self->_dragAndDropGesture, "selectedLayoutRole");
  else
    v13 = -[SBLayoutElement layoutRole](self->_layoutElementForWindowDrag, "layoutRole");
  -[SBDragAndDropGestureSwitcherModifierEvent setDraggedSceneLayoutRole:](v11, "setDraggedSceneLayoutRole:", v13);
  -[SBDragAndDropWorkspaceTransaction _platterFrameInSwitcherView](self, "_platterFrameInSwitcherView");
  -[SBDragAndDropGestureSwitcherModifierEvent setPlatterViewFrame:](v11, "setPlatterViewFrame:");
  -[SBDragAndDropWorkspaceTransaction _platterScale](self, "_platterScale");
  -[SBDragAndDropGestureSwitcherModifierEvent setPlatterScale:](v11, "setPlatterScale:");
  -[SBDragAndDropGestureSwitcherModifierEvent setSwitcherDropRegionContext:](v11, "setSwitcherDropRegionContext:", self->_currentSwitcherDropRegionContext);
  -[SBApplicationDropSession localContext](self->_dropSession, "localContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDragAndDropGestureSwitcherModifierEvent setWindowDrag:](v11, "setWindowDrag:", objc_msgSend(v14, "startLocation") == 8);

  -[SBApplicationDropSession localContext](self->_dropSession, "localContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDragAndDropGestureSwitcherModifierEvent setSwitcherDrag:](v11, "setSwitcherDrag:", objc_msgSend(v15, "startLocation") == 11);

  -[SBDragAndDropGestureSwitcherModifierEvent setPreviewHasLifted:](v11, "setPreviewHasLifted:", self->_windowLiftAnimationCompleted);
  -[SBDragAndDropGestureSwitcherModifierEvent setPlatterized:](v11, "setPlatterized:", self->_windowDragEnteredPlatterZone);
  if (-[SBDragAndDropWorkspaceTransaction isInterrupted](self, "isInterrupted"))
  {
    -[SBGestureSwitcherModifierEvent setCanceled:](v11, "setCanceled:", 1);
  }
  else
  {
    -[SBDragAndDropWorkspaceTransaction error](self, "error");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBGestureSwitcherModifierEvent setCanceled:](v11, "setCanceled:", v16 != 0);

  }
  return v11;
}

- (void)_begin
{
  void *v3;
  void *v4;
  void *v5;
  BSInvalidatable *v6;
  BSInvalidatable *deferOrientationUpdatesForDragAndDropAssertion;
  void *v8;
  NSUUID *v9;
  NSUUID *gestureID;
  void *v11;
  SBFluidSwitcherGesture *v12;
  SBFluidSwitcherGesture *dragAndDropGesture;
  SBLayoutElement *layoutElementForWindowDrag;
  uint64_t v15;
  SBMainDisplayLayoutState *currentLayoutState;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id WeakRetained;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  id location;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)SBDragAndDropWorkspaceTransaction;
  -[SBDragAndDropWorkspaceTransaction _begin](&v42, sel__begin);
  +[SBKeyboardSuppressionManager sharedInstance](SBKeyboardSuppressionManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startSuppressingKeyboardWithReason:predicate:displayIdentity:", CFSTR("medusa-drag"), 0, v5);

  objc_msgSend((id)SBApp, "deviceOrientationUpdateDeferralAssertionWithReason:", CFSTR("SBDragAndDropAppActivationDisableRotationReason"));
  v6 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  deferOrientationUpdatesForDragAndDropAssertion = self->_deferOrientationUpdatesForDragAndDropAssertion;
  self->_deferOrientationUpdatesForDragAndDropAssertion = v6;

  self->_performedDrop = 0;
  -[SBDragAndDropWorkspaceTransaction addMilestone:](self, "addMilestone:", CFSTR("SBDragAndDropAppActivationDraggingMilestone"));
  objc_msgSend((id)SBApp, "transactionForDismissingSearchTransientOverlay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    -[SBDragAndDropWorkspaceTransaction addChildTransaction:withSchedulingPolicy:](self, "addChildTransaction:withSchedulingPolicy:", v8, 0);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  gestureID = self->_gestureID;
  self->_gestureID = v9;

  if (!self->_currentDropActionProposedLayoutState)
    -[SBDragAndDropWorkspaceTransaction _updateCurrentDropActionProposedLayoutState](self, "_updateCurrentDropActionProposedLayoutState");
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  objc_initWeak(&location, self);
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __43__SBDragAndDropWorkspaceTransaction__begin__block_invoke;
  v39[3] = &unk_1E8EA6B00;
  objc_copyWeak(&v40, &location);
  v11 = (void *)MEMORY[0x1D17E5550](v39);
  v12 = -[SBFluidSwitcherGesture initWithType:eventProvider:]([SBFluidSwitcherGesture alloc], "initWithType:eventProvider:", 6, v11);
  dragAndDropGesture = self->_dragAndDropGesture;
  self->_dragAndDropGesture = v12;

  layoutElementForWindowDrag = self->_layoutElementForWindowDrag;
  if (layoutElementForWindowDrag)
  {
    v15 = -[SBLayoutElement layoutRole](layoutElementForWindowDrag, "layoutRole");
    currentLayoutState = self->_currentLayoutState;
    if (v15 == 3)
    {
      -[SBMainDisplayLayoutState floatingAppLayout](currentLayoutState, "floatingAppLayout");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "anyLeafAppLayout");
    }
    else
    {
      -[SBMainDisplayLayoutState appLayout](currentLayoutState, "appLayout");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "leafAppLayoutForRole:", -[SBLayoutElement layoutRole](self->_layoutElementForWindowDrag, "layoutRole"));
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (-[SBMainDisplayLayoutState unlockedEnvironmentMode](self->_currentLayoutState, "unlockedEnvironmentMode") == 2)
  {
    -[SBDeviceApplicationSceneHandle sceneIdentifier](self->_draggingApplicationSceneHandle, "sceneIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "appLayouts");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __43__SBDragAndDropWorkspaceTransaction__begin__block_invoke_2;
    v37[3] = &unk_1E8E9DF78;
    v20 = v18;
    v38 = v20;
    objc_msgSend(v19, "bs_firstObjectPassingTest:", v37);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "allItems");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __43__SBDragAndDropWorkspaceTransaction__begin__block_invoke_3;
    v35[3] = &unk_1E8E9DF50;
    v17 = v20;
    v36 = v17;
    objc_msgSend(v22, "bs_firstObjectPassingTest:", v35);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBFluidSwitcherGesture _setSelectedLayoutRole:](self->_dragAndDropGesture, "_setSelectedLayoutRole:", objc_msgSend(v21, "layoutRoleForItem:", v23));
LABEL_12:

    goto LABEL_13;
  }
  v21 = 0;
LABEL_13:
  -[SBMainDisplayLayoutState appLayout](self->_initialLayoutState, "appLayout");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationDropSession sceneIdentity](self->_dropSession, "sceneIdentity");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "identifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  self->_draggingExistingItemFromActiveLayoutState = objc_msgSend(v24, "containsItemWithUniqueIdentifier:", v26);

  -[SBFluidSwitcherGesture _setSelectedAppLayout:](self->_dragAndDropGesture, "_setSelectedAppLayout:", v21);
  -[SBFluidSwitcherGesture _setState:](self->_dragAndDropGesture, "_setState:", 1);
  if (self->_layoutElementForWindowDrag)
  {
    -[SBDeviceApplicationSceneHandle sceneIdentifier](self->_draggingApplicationSceneHandle, "sceneIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "appLayouts");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __43__SBDragAndDropWorkspaceTransaction__begin__block_invoke_4;
    v33[3] = &unk_1E8E9DF78;
    v29 = v27;
    v34 = v29;
    objc_msgSend(v28, "bs_firstObjectPassingTest:", v33);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
      -[SBFluidSwitcherGesture _setSelectedAppLayout:](self->_dragAndDropGesture, "_setSelectedAppLayout:", v30);

  }
  v31 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v31, "dragAndDropTransaction:didBeginGesture:", self, self->_dragAndDropGesture);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);

}

id __43__SBDragAndDropWorkspaceTransaction__begin__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_currentGestureEventForGesture:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __43__SBDragAndDropWorkspaceTransaction__begin__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsItemWithUniqueIdentifier:", *(_QWORD *)(a1 + 32));
}

uint64_t __43__SBDragAndDropWorkspaceTransaction__begin__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

BOOL __43__SBDragAndDropWorkspaceTransaction__begin__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  if (objc_msgSend(v3, "containsItemWithUniqueIdentifier:", *(_QWORD *)(a1 + 32)))
    v4 = objc_msgSend(v3, "environment") == 2;
  else
    v4 = 0;

  return v4;
}

- (void)_didComplete
{
  void *v3;
  BSInvalidatable *deferOrientationUpdatesForDragAndDropAssertion;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  objc_super v8;

  if (-[SBDragAndDropWorkspaceTransaction isInterrupted](self, "isInterrupted"))
  {
    -[SBApplicationDropSession uiDragDropSession](self->_dropSession, "uiDragDropSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDragAndDropWorkspaceTransaction _handleSessionDidEnd:](self, "_handleSessionDidEnd:", v3);

  }
  -[SBDragAndDropWorkspaceTransaction _endDragAndDropFluidGesture](self, "_endDragAndDropFluidGesture");
  -[BSInvalidatable invalidate](self->_deferOrientationUpdatesForDragAndDropAssertion, "invalidate");
  deferOrientationUpdatesForDragAndDropAssertion = self->_deferOrientationUpdatesForDragAndDropAssertion;
  self->_deferOrientationUpdatesForDragAndDropAssertion = 0;

  +[SBKeyboardSuppressionManager sharedInstance](SBKeyboardSuppressionManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopSuppressingKeyboardWithReason:", CFSTR("medusa-drag"));

  -[SBAppPlatterDragPreview invalidateSourceView](self->_activePlatterPreview, "invalidateSourceView");
  -[SBAppPlatterDragSourceViewProviding setDragging:](self->_activeSourceViewProvider, "setDragging:", 0);
  -[SBMainWorkspaceTransitionRequest completionBlock](self->_dropTransitionRequest, "completionBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SBMainWorkspaceTransitionRequest completionBlock](self->_dropTransitionRequest, "completionBlock");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7[2](v7, 1);

  }
  v8.receiver = self;
  v8.super_class = (Class)SBDragAndDropWorkspaceTransaction;
  -[SBMainWorkspaceTransaction _didComplete](&v8, sel__didComplete);
}

- (void)_endDragAndDropFluidGesture
{
  CADisplayLink *displayLinkForWindowDrag;
  id WeakRetained;
  SBFluidSwitcherGesture *dragAndDropGesture;

  if (self->_dragAndDropGesture)
  {
    -[CADisplayLink invalidate](self->_displayLinkForWindowDrag, "invalidate");
    displayLinkForWindowDrag = self->_displayLinkForWindowDrag;
    self->_displayLinkForWindowDrag = 0;

    -[SBFluidSwitcherGesture _setState:](self->_dragAndDropGesture, "_setState:", 3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "dragAndDropTransaction:didEndGesture:", self, self->_dragAndDropGesture);

    dragAndDropGesture = self->_dragAndDropGesture;
    self->_dragAndDropGesture = 0;

  }
}

- (void)_childTransactionDidComplete:(id)a3
{
  SBToAppsWorkspaceTransaction *v4;
  objc_super v5;

  v4 = (SBToAppsWorkspaceTransaction *)a3;
  v5.receiver = self;
  v5.super_class = (Class)SBDragAndDropWorkspaceTransaction;
  -[SBDragAndDropWorkspaceTransaction _childTransactionDidComplete:](&v5, sel__childTransactionDidComplete_, v4);
  if (self->_currentWorkspaceTransaction == v4)
  {
    self->_currentWorkspaceTransaction = 0;

    self->_layoutStateTransitionCompleted = 1;
    -[NSMutableSet removeAllObjects](self->_pendingSceneUpdatesTransactions, "removeAllObjects");
    goto LABEL_5;
  }
  if ((SBToAppsWorkspaceTransaction *)self->_sceneUpdateTransactionForWindowDrag == v4)
  {
    self->_sceneUpdateTransactionForWindowDrag = 0;

LABEL_5:
    -[SBDragAndDropWorkspaceTransaction _updatePlatterPreviewForSetDown:animated:](self, "_updatePlatterPreviewForSetDown:animated:", 1, 1);
  }

}

- (BOOL)_canBeInterrupted
{
  return -[SBWorkspaceTransaction _isInterruptingForTransitionRequest](self, "_isInterruptingForTransitionRequest")
      || self->_dragExitedDropZone;
}

- (BOOL)canInterruptForTransitionRequest:(id)a3
{
  if ((-[SBDragAndDropWorkspaceTransaction isComplete](self, "isComplete", a3) & 1) != 0
    || (-[SBDragAndDropWorkspaceTransaction isInterrupted](self, "isInterrupted") & 1) != 0
    || self->_layoutElementForWindowDrag
    && (!self->_windowDragEnteredPlatterZone || self->_sceneUpdateTransactionForWindowDrag)
    && !self->_performedDrop
    || self->_currentDropAction == 10 && !self->_dropAnimationCompleted
    || (-[SBDragAndDropWorkspaceTransaction isWaitingForMilestone:](self, "isWaitingForMilestone:", CFSTR("SBDragAndDropAppActivationPlatterFadeOutMilestone")) & 1) != 0|| (-[SBDragAndDropWorkspaceTransaction isWaitingForMilestone:](self, "isWaitingForMilestone:", CFSTR("SBDragAndDropAppActivationWaitingToAddToAppsTransactionMilestone")) & 1) != 0)
  {
    return 0;
  }
  if ((self->_currentWorkspaceTransaction || self->_performedDrop) && !self->_dropAnimationCompleted)
    return self->_performedDrop;
  return 1;
}

- (void)_willInterruptWithReason:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBDragAndDropWorkspaceTransaction;
  -[SBDragAndDropWorkspaceTransaction _willInterruptWithReason:](&v5, sel__willInterruptWithReason_, a3);
  -[SBDragAndDropWorkspaceTransaction _endDragAndDropFluidGesture](self, "_endDragAndDropFluidGesture");
  -[SBWorkspaceTransaction layoutStateTransitionCoordinator](self, "layoutStateTransitionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isTransitioning"))
  {
    objc_msgSend(v4, "willEndTransition");
    objc_msgSend(v4, "endTransitionWithError:", 0);
  }

}

- (void)_willInterruptForTransitionRequest:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBDragAndDropWorkspaceTransaction;
  v4 = a3;
  -[SBWorkspaceTransaction _willInterruptForTransitionRequest:](&v7, sel__willInterruptForTransitionRequest_, v4);
  v5 = objc_opt_class();
  SBSafeCast(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "source", v7.receiver, v7.super_class) == 27 || self->_performedDrop)
    -[SBAppPlatterDragPreview dropDestinationAnimationCompleted](self->_activePlatterPreview, "dropDestinationAnimationCompleted");

}

- (void)_didInterruptWithReason:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBDragAndDropWorkspaceTransaction;
  -[SBDragAndDropWorkspaceTransaction _didInterruptWithReason:](&v7, sel__didInterruptWithReason_, v4);
  self->_sessionState = 2;
  if (!self->_performedDrop)
  {
    objc_storeStrong((id *)&self->_finalLayoutState, self->_currentLayoutState);
    -[SBApplicationDropSession uiDragDropSession](self->_dropSession, "uiDragDropSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDragAndDropWorkspaceTransaction _updateCurrentDropActionForSession:](self, "_updateCurrentDropActionForSession:", v5);

    -[SBDragAndDropWorkspaceTransaction _cleanUpAndCompleteTransactionIfNecessary](self, "_cleanUpAndCompleteTransactionIfNecessary");
  }
  SBLogMedusaDropDestination();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v4;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "SBAppDrop transaction did interrupt for reason: %{public}@", buf, 0xCu);
  }

}

- (CGRect)_platterFrameInSwitcherView
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  SBAppPlatterDragPreview *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  -[SBWorkspaceTransaction windowScene](self, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "switcherController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBApplicationDropSession uiDragDropSession](self->_dropSession, "uiDragDropSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  objc_msgSend(WeakRetained, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v7);

  objc_msgSend(v4, "frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:", -[SBLayoutState interfaceOrientation](self->_currentLayoutState, "interfaceOrientation"), 2);
  v8 = self->_activePlatterPreview;
  -[SBAppPlatterDragPreview platterView](v8, "platterView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");

  -[SBDragAndDropWorkspaceTransaction _platterScale](self, "_platterScale");
  SBRectWithSize();
  UIRectGetCenter();
  UIRectCenteredAboutPoint();
  -[SBAppPlatterDragPreview convertRect:toView:](v8, "convertRect:toView:", v8);

  UIRectCenteredAboutPoint();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)_updateCurrentDropActionForSession:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  char v44;
  int v45;
  void *v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  _BOOL4 v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  unint64_t v70;
  char v71;
  char v72;
  uint64_t v73;
  CGFloat x;
  double v75;
  CGFloat y;
  double v77;
  _BOOL4 v78;
  CGFloat v79;
  double v80;
  double v81;
  void *v82;
  uint64_t v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  void *v93;
  void *v94;
  double v95;
  CGFloat v96;
  double v97;
  CGFloat v98;
  double v99;
  CGFloat v100;
  double v101;
  CGFloat v102;
  double v103;
  uint64_t v104;
  CGFloat v105;
  double v106;
  _BOOL4 v107;
  CGFloat v108;
  int64_t v109;
  uint64_t (**v110)(void);
  int64_t v111;
  uint64_t v112;
  _BOOL4 v113;
  void *v114;
  int v115;
  NSObject *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  void *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  double v134;
  double v135;
  double v136;
  double v137;
  int64_t v138;
  void *v139;
  SBSwitcherDropRegionContext *v140;
  SBSwitcherDropRegionContext *currentSwitcherDropRegionContext;
  double v142;
  double v143;
  double v144;
  double width;
  double height;
  uint64_t v147;
  double v148;
  double v149;
  id v150;
  CGFloat point;
  uint64_t (**v152)(double, double, double, double, double, double, double, double, double, double);
  uint64_t v153;
  uint64_t (**v154)(void);
  int v155;
  int v156;
  double v157;
  double v158;
  uint64_t v159;
  uint64_t (**v160)(void);
  void *v161;
  id v162;
  double v163;
  CGRect recta;
  uint64_t v165;
  uint64_t (*v166)(uint64_t);
  void *v167;
  SBDragAndDropWorkspaceTransaction *v168;
  double v169;
  uint64_t v170;
  CGFloat v171;
  double v172;
  CGFloat v173;
  double v174;
  double v175;
  CGFloat v176;
  _QWORD v177[7];
  BOOL v178;
  _QWORD v179[5];
  id v180;
  double v181;
  CGFloat v182;
  CGFloat v183;
  double v184;
  CGFloat v185;
  double v186;
  double v187;
  int64_t v188;
  BOOL v189;
  BOOL v190;
  _QWORD v191[5];
  NSObject *v192;
  uint64_t *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t *v196;
  uint64_t v197;
  char v198;
  CGPoint v199;
  CGPoint v200;
  CGPoint v201;
  CGRect v202;
  CGRect v203;
  CGRect v204;
  CGRect v205;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  v6 = objc_loadWeakRetained((id *)&self->_switcherContentController);
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "windowScene");
  *(_QWORD *)&recta.size.width = objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(WeakRetained, "isChamoisWindowingUIEnabled");
  if (v8
    && -[SBMainDisplayLayoutState unlockedEnvironmentMode](self->_initialLayoutState, "unlockedEnvironmentMode") == 3)
  {
    v161 = v7;
    v9 = v4;
    -[SBMainDisplayLayoutState appLayout](self->_initialLayoutState, "appLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "visibleItemContainers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leafAppLayoutForRole:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    objc_msgSend(v10, "itemForLayoutRole:", 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    recta.origin.x = v15;
    if (v22)
    {
      v23 = v6;
      objc_msgSend(v6, "visibleItemContainers");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "leafAppLayoutForRole:", 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKey:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "frame");
      v28 = v27;
      v30 = v29;

      recta.origin.y = v30 + v28 - (v15 + v19);
    }
    else
    {
      recta.origin.y = v19;
      v23 = v6;
    }

    v4 = v9;
    v6 = v23;
    v7 = v161;
  }
  else
  {
    objc_msgSend(v7, "bounds");
    recta.origin.x = v31;
    recta.origin.y = v32;
    v17 = v33;
    v21 = v34;
  }
  objc_msgSend(v4, "locationInView:", v7);
  v36 = v35;
  v38 = v37;
  -[SBTouchHistory averageTouchVelocityOverTimeDuration:](self->_touchHistory, "averageTouchVelocityOverTimeDuration:", 0.0416666667);
  v40 = v39;
  v42 = v41;
  v43 = -[SBDragAndDropWorkspaceTransaction isInterrupted](self, "isInterrupted");
  if (self->_dragExitedDropZone || (!self->_activePlatterPreview ? (v44 = 1) : (v44 = v43), (v44 & 1) != 0))
  {
    v45 = 0;
    goto LABEL_14;
  }
  v159 = v42;
  v163 = v17;
  v79 = v38;
  v80 = v40;
  v81 = v21;
  -[SBApplicationDropSession localContext](self->_dropSession, "localContext");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v82, "startLocation");

  objc_msgSend(*(id *)&recta.size.width, "floatingDockController");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "floatingDockScreenFrame");
  v86 = v85;
  v88 = v87;
  v90 = v89;
  v92 = v91;

  objc_msgSend(*(id *)&recta.size.width, "screen");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "fixedCoordinateSpace");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertRect:fromCoordinateSpace:", v94, v86, v88, v90, v92);
  v96 = v95;
  v98 = v97;
  v100 = v99;
  v102 = v101;

  if (v83 != 8)
  {
    v203.origin.x = v96;
    v203.origin.y = v98;
    v203.size.width = v100;
    v203.size.height = v102;
    v200.x = v36;
    v200.y = v79;
    if (CGRectContainsPoint(v203, v200))
    {
      v45 = 0;
LABEL_61:
      v21 = v81;
      v42 = v159;
      v17 = v163;
      v40 = v80;
      v38 = v79;
      goto LABEL_14;
    }
  }
  -[SBDragAndDropWorkspaceTransaction _iconManager](self, "_iconManager");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = objc_msgSend(v114, "hasOpenFolderInLocation:", *MEMORY[0x1E0DAA998]);

  if (!v115)
  {
    v45 = 1;
    goto LABEL_61;
  }
  SBLogMedusaDropDestination();
  v116 = objc_claimAutoreleasedReturnValue();
  v21 = v81;
  v40 = v80;
  v38 = v79;
  v42 = v159;
  if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
    -[SBDragAndDropWorkspaceTransaction _updateCurrentDropActionForSession:].cold.2(v116, v117, v118, v119, v120, v121, v122, v123);

  v45 = 0;
  v17 = v163;
LABEL_14:
  if (-[SBMainDisplayLayoutState unlockedEnvironmentMode](self->_currentLayoutState, "unlockedEnvironmentMode") == 3)
  {
    -[SBMainDisplayLayoutState appLayout](self->_currentLayoutState, "appLayout");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "itemForLayoutRole:", 4);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      SBLogMedusaDropDestination();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        -[SBDragAndDropWorkspaceTransaction _updateCurrentDropActionForSession:].cold.1(v48, v49, v50, v51, v52, v53, v54, v55);
      v56 = 0;
      goto LABEL_85;
    }
  }
  if (v45)
  {
    v157 = v40;
    v162 = v4;
    v57 = objc_msgSend(WeakRetained, "windowManagementStyle");
    objc_msgSend(WeakRetained, "displayIdentity");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = objc_msgSend(v59, "isMedusaCapable");

    v60 = objc_msgSend(WeakRetained, "windowManagementStyle");
    v153 = objc_msgSend(WeakRetained, "windowManagementStyle");
    -[SBApplicationSceneHandle application](self->_draggingApplicationSceneHandle, "application");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v155 = objc_msgSend(v61, "supportsMultiWindowLayoutsForSwitcherWindowManagementStyle:displayIdentity:", v57, v58);

    v195 = 0;
    v196 = &v195;
    v197 = 0x2020000000;
    v198 = 1;
    v191[0] = MEMORY[0x1E0C809B0];
    v191[1] = 3221225472;
    v191[2] = __72__SBDragAndDropWorkspaceTransaction__updateCurrentDropActionForSession___block_invoke;
    v191[3] = &unk_1E8EB21F0;
    v191[4] = self;
    v194 = v57;
    v48 = v58;
    v192 = v48;
    v193 = &v195;
    SBLayoutRoleEnumerateAppLayoutRoles(v191);
    objc_msgSend((id)objc_opt_class(), "prototypeSettingsFullscreenActivationRegionSize");
    SBRectWithSize();
    UIRectCenteredXInRect();
    v199.x = v36;
    v199.y = v38;
    v62 = CGRectContainsPoint(v202, v199);
    v63 = v17;
    objc_msgSend((id)objc_opt_class(), "prototypeSettingsSideActivationGutterSize");
    v65 = v64;
    v66 = v21;
    -[SBLayoutState interfaceOrientation](self->_currentLayoutState, "interfaceOrientation");
    SBLayoutDefaultSideLayoutElementWidth();
    v68 = v67;
    -[SBDragAndDropWorkspaceTransaction _platterScale](self, "_platterScale");
    if (v8)
    {
      v70 = -[SBApplicationDropSession dropZones](self->_dropSession, "dropZones");
      if (v60)
      {
        if (v156)
        {
          v71 = v155;
          if (!*((_BYTE *)v196 + 24))
            v71 = 0;
          v4 = v162;
          if ((v71 & 1) != 0)
          {
            v56 = v70 < 2;
            v72 = v70 > 1 || v62;
            if ((v72 & 1) == 0)
            {
              v73 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
              x = recta.origin.x;
              v75 = v63;
              y = recta.origin.y;
              v77 = v21;
              if (v73 == 1)
                v78 = v36 >= CGRectGetMidX(*(CGRect *)&x);
              else
                v78 = v36 < CGRectGetMidX(*(CGRect *)&x);
              v4 = v162;
              if (v78)
                v56 = 4;
              else
                v56 = 5;
            }
          }
          else
          {
            v56 = 1;
          }
          goto LABEL_84;
        }
        v56 = 1;
      }
      else
      {
        v56 = v62;
      }
      v4 = v162;
LABEL_84:

      _Block_object_dispose(&v195, 8);
LABEL_85:

      goto LABEL_86;
    }
    v103 = v69;
    point = v38;
    v104 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
    v105 = v36;
    v106 = v65 + v65 + v68 * v103 * 0.5;
    v148 = recta.origin.y * 0.5;
    v149 = v36 + v157 * 0.15;
    v107 = v149 < recta.origin.y * 0.5;
    if (v104 == 1)
      v107 = v149 >= recta.origin.y * 0.5;
    if (v107)
      v56 = 6;
    else
      v56 = 7;
    v108 = MEMORY[0x1E0C809B0];
    v179[0] = MEMORY[0x1E0C809B0];
    v179[1] = 3221225472;
    v179[2] = __72__SBDragAndDropWorkspaceTransaction__updateCurrentDropActionForSession___block_invoke_2;
    v179[3] = &unk_1E8EB2218;
    v179[4] = self;
    v150 = WeakRetained;
    v180 = v150;
    v181 = v36;
    v182 = point;
    v183 = recta.origin.x;
    v184 = v63;
    v185 = recta.origin.y;
    v186 = v66;
    v187 = v106;
    v189 = v62;
    v188 = v56;
    v190 = v60 != 0;
    v154 = (uint64_t (**)(void))MEMORY[0x1D17E5550](v179);
    *(CGFloat *)v177 = v108;
    v177[1] = 3221225472;
    v177[2] = __72__SBDragAndDropWorkspaceTransaction__updateCurrentDropActionForSession___block_invoke_3;
    v177[3] = &unk_1E8EB2240;
    *(double *)&v177[5] = v36;
    *(CGFloat *)&v177[6] = point;
    v177[4] = self;
    v178 = v62;
    v152 = (uint64_t (**)(double, double, double, double, double, double, double, double, double, double))MEMORY[0x1D17E5550](v177);
    recta.size.height = v108;
    v165 = 3221225472;
    v166 = __72__SBDragAndDropWorkspaceTransaction__updateCurrentDropActionForSession___block_invoke_4;
    v167 = &unk_1E8EB2268;
    v168 = self;
    v169 = v157;
    v170 = v42;
    v171 = recta.origin.x;
    v172 = v63;
    v173 = recta.origin.y;
    v174 = v66;
    v175 = v36;
    v176 = point;
    v160 = (uint64_t (**)(void))MEMORY[0x1D17E5550](&recta.size.height);
    v109 = -[SBApplicationDropSession dropZones](self->_dropSession, "dropZones");
    if ((v156 & v155 & 1) == 0)
    {
      v56 = 1;
LABEL_82:
      v4 = v162;
      goto LABEL_83;
    }
    if (*((_BYTE *)v196 + 24))
    {
      if (v109 != 2)
      {
        if (v109 != 1)
        {
          if (v109)
          {
            v56 = 0;
            goto LABEL_82;
          }
          v4 = v162;
          if (!-[SBMainDisplayLayoutState isFloatingSwitcherVisible](self->_currentLayoutState, "isFloatingSwitcherVisible"))
          {
            v110 = v154;
            if (self->_layoutElementForWindowDrag)
            {
              v110 = v154;
              if (!self->_windowDragEnteredPlatterZone)
              {
                v111 = -[SBLayoutElement layoutRole](self->_layoutElementForWindowDrag, "layoutRole");
                v110 = v160;
                if (v111 != 3)
                {
                  v112 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
                  v113 = v149 >= v148;
                  if (v112 != 1)
                    v113 = v149 < v148;
                  if (v113)
                    v56 = 4;
                  else
                    v56 = 5;
                  goto LABEL_82;
                }
              }
            }
            goto LABEL_72;
          }
LABEL_83:

          goto LABEL_84;
        }
        if (v60)
        {
          objc_msgSend((id)objc_opt_class(), "prototypeSettingsContentDraggingSideActivationWidth");
          v128 = v127;
          objc_msgSend((id)objc_opt_class(), "prototypeSettingsContentDraggingFloatingActivationWidth");
          v124 = v152[2](recta.origin.x, v63, recta.origin.y, v66, recta.origin.x, v63, recta.origin.y, v66, v128, v129);
          goto LABEL_78;
        }
LABEL_80:
        if (v62)
          v56 = 1;
        goto LABEL_82;
      }
      if (!v60)
        goto LABEL_80;
      objc_msgSend((id)objc_opt_class(), "prototypeSettingsWindowTearOffDraggingSideActivationWidth");
      v158 = v125;
      objc_msgSend((id)objc_opt_class(), "prototypeSettingsWindowTearOffDraggingFloatingActivationWidth");
      v4 = v162;
      if (!v62)
      {
        v142 = v126;
        objc_msgSend((id)objc_opt_class(), "sourceSceneInterfaceOrientedBoundsForDropSession:switcherController:", self->_dropSession, v150);
        v143 = v204.origin.x;
        v144 = v204.origin.y;
        width = v204.size.width;
        height = v204.size.height;
        if (CGRectIsNull(v204)
          || (v205.size.height = height,
              v205.origin.x = v143,
              v205.origin.y = v144,
              v205.size.width = width,
              v201.x = v105,
              v201.y = point,
              !CGRectContainsPoint(v205, v201)))
        {
          v147 = v154[2]();
        }
        else
        {
          v147 = v152[2](recta.origin.x, v63, recta.origin.y, v66, v143, v144, width, height, recta.origin.y / recta.origin.y * v158, recta.origin.y / recta.origin.y * v142);
        }
        if (v147)
          v56 = v147;
        goto LABEL_83;
      }
LABEL_75:
      v56 = 1;
      goto LABEL_83;
    }
    v4 = v162;
    if (v62)
    {
      if (!self->_layoutElementForWindowDrag)
        goto LABEL_75;
      v56 = 1;
      if (self->_windowDragEnteredPlatterZone)
        goto LABEL_83;
      v110 = v160;
      if (v153 != 1)
        goto LABEL_83;
    }
    else
    {
      v110 = v160;
      if (v153 != 1)
        goto LABEL_75;
    }
LABEL_72:
    v124 = v110[2]();
LABEL_78:
    v56 = v124;
    goto LABEL_82;
  }
  v56 = 0;
LABEL_86:
  if (-[SBMainDisplayLayoutState unlockedEnvironmentMode](self->_currentLayoutState, "unlockedEnvironmentMode") == 2
    && (-[SBApplicationDropSession localContext](self->_dropSession, "localContext"),
        v130 = (void *)objc_claimAutoreleasedReturnValue(),
        v131 = objc_msgSend(v130, "startLocation"),
        v130,
        v131 == 11)
    && self->_dragAndDropGesture)
  {
    -[SBApplicationDropSession uiDragDropSession](self->_dropSession, "uiDragDropSession");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "locationInView:", v133);
    v135 = v134;
    v137 = v136;

    v138 = -[SBFluidSwitcherGesture selectedLayoutRole](self->_dragAndDropGesture, "selectedLayoutRole");
    -[SBFluidSwitcherGesture selectedAppLayout](self->_dragAndDropGesture, "selectedAppLayout");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_switcherDropRegionContextForDraggingLayoutRole:inAppLayout:atLocation:", v138, v139, v135, v137);
    v140 = (SBSwitcherDropRegionContext *)objc_claimAutoreleasedReturnValue();

    currentSwitcherDropRegionContext = self->_currentSwitcherDropRegionContext;
    self->_currentSwitcherDropRegionContext = v140;

    v56 = 10;
  }
  else
  {
    v132 = self->_currentSwitcherDropRegionContext;
    self->_currentSwitcherDropRegionContext = 0;
  }

  if (self->_currentDropAction != v56)
  {
    self->_currentDropAction = v56;
    -[SBDragAndDropWorkspaceTransaction _updateCurrentDropActionProposedLayoutState](self, "_updateCurrentDropActionProposedLayoutState");
  }

}

void __72__SBDragAndDropWorkspaceTransaction__updateCurrentDropActionForSession___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  objc_msgSend(*(id *)(a1[4] + 248), "elementWithRole:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workspaceEntity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationSceneEntity");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v8;
  if (v8)
  {
    objc_msgSend(v8, "application");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsMultiWindowLayoutsForSwitcherWindowManagementStyle:displayIdentity:", a1[7], a1[5]);

    v5 = v8;
    if ((v7 & 1) == 0)
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }

}

uint64_t __72__SBDragAndDropWorkspaceTransaction__updateCurrentDropActionForSession___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  BOOL v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v41;
  BOOL v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  _BOOL4 v48;
  BOOL v49;
  _BOOL4 v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  _BOOL4 v55;
  double v56;
  uint64_t result;
  double v58;
  BOOL v59;
  uint64_t v60;
  double v61;
  CGFloat rect;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat MinY;
  CGFloat v67;
  CGFloat MaxX;
  CGFloat v69;
  double MinX;
  double v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "layoutContainsRole:", 2))
  {
    if (*(_BYTE *)(a1 + 113))
    {
      v41 = *(double *)(a1 + 48);
      if (v41 < CGRectGetMinX(*(CGRect *)(a1 + 64)) + *(double *)(a1 + 96))
      {
        v42 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1;
        v43 = 4;
        goto LABEL_34;
      }
      v61 = *(double *)(a1 + 48);
      if (v61 > CGRectGetMaxX(*(CGRect *)(a1 + 64)) - *(double *)(a1 + 96))
      {
        v59 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1;
        v60 = 4;
LABEL_41:
        if (v59)
          return v60;
        else
          return v60 + 1;
      }
    }
    if (*(_BYTE *)(a1 + 112))
      return 1;
    return *(_QWORD *)(a1 + 104);
  }
  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "appLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frameForItemWithRole:inMainAppLayout:interfaceOrientation:", 1, v3, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "interfaceOrientation"));
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "appLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frameForItemWithRole:inMainAppLayout:interfaceOrientation:", 2, v13, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "interfaceOrientation"));
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v75 = v15;
  v76 = v21;
  v73 = v19;
  v74 = v17;
  if (SBSpaceConfigurationIsSplitView(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "spaceConfiguration")))
  {
    v77.origin.x = v5;
    v77.origin.y = v7;
    v77.size.width = v9;
    v77.size.height = v11;
    MinX = CGRectGetMinX(v77);
    v78.origin.x = v15;
    v78.origin.y = v17;
    v78.size.width = v19;
    v78.size.height = v21;
    v22 = CGRectGetMinX(v78);
    v23 = MinX < v22;
    if (MinX >= v22)
      v24 = v15;
    else
      v24 = v5;
    v25 = v15;
    if (MinX >= v22)
      v26 = v17;
    else
      v26 = v7;
    v27 = v17;
    if (MinX >= v22)
      v28 = v19;
    else
      v28 = v9;
    v29 = v19;
    if (MinX >= v22)
      v30 = v21;
    else
      v30 = v11;
    v71 = v5;
    if (v23)
    {
      v5 = v25;
      v31 = v27;
    }
    else
    {
      v31 = v7;
    }
    if (v23)
      v32 = v29;
    else
      v32 = v9;
    v63 = v32;
    v64 = v31;
    if (v23)
      v33 = v21;
    else
      v33 = v11;
    rect = v33;
    v34 = v24;
    v79.origin.x = v24;
    v79.origin.y = v26;
    v79.size.width = v28;
    v79.size.height = v30;
    MaxX = CGRectGetMaxX(v79);
    v80.origin.x = v34;
    v80.origin.y = v26;
    v80.size.width = v28;
    v80.size.height = v30;
    MinY = CGRectGetMinY(v80);
    v81.origin.x = v5;
    v81.size.width = v63;
    v81.origin.y = v64;
    v81.size.height = rect;
    v35 = CGRectGetMinX(v81);
    v82.origin.x = v34;
    v82.origin.y = v26;
    v82.size.width = v28;
    v82.size.height = v30;
    v36 = v35 - CGRectGetMaxX(v82);
    v83.origin.x = v34;
    v83.origin.y = v26;
    v83.size.width = v28;
    v83.size.height = v30;
    v84.size.height = CGRectGetHeight(v83);
    v84.origin.y = MinY;
    v84.origin.x = MaxX;
    v84.size.width = v36;
    v5 = v71;
    v85 = CGRectInset(v84, -50.0, 0.0);
    x = v85.origin.x;
    y = v85.origin.y;
    width = v85.size.width;
    height = v85.size.height;
  }
  else
  {
    x = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  objc_msgSend(*(id *)(a1 + 40), "frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "interfaceOrientation", *(_QWORD *)&rect), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "floatingConfiguration"));
  v69 = v45;
  v72 = v44;
  v65 = v47;
  v67 = v46;
  v86.origin.x = v5;
  v86.origin.y = v7;
  v86.size.width = v9;
  v86.size.height = v11;
  v48 = CGRectContainsPoint(v86, *(CGPoint *)(a1 + 48));
  v87.origin.y = v74;
  v87.origin.x = v75;
  v87.size.width = v73;
  v87.size.height = v76;
  v49 = CGRectContainsPoint(v87, *(CGPoint *)(a1 + 48));
  v88.origin.x = x;
  v88.origin.y = y;
  v88.size.width = width;
  v88.size.height = height;
  v50 = CGRectContainsPoint(v88, *(CGPoint *)(a1 + 48));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "layoutContainsRole:", 3))
  {
    objc_msgSend(*(id *)(a1 + 32), "_platterFrameInSwitcherView");
    v90.origin.x = v51;
    v90.origin.y = v52;
    v90.size.width = v53;
    v90.size.height = v54;
    v89.origin.y = v69;
    v89.origin.x = v72;
    v89.size.height = v65;
    v89.size.width = v67;
    v55 = CGRectIntersectsRect(v89, v90);
  }
  else
  {
    v55 = 0;
  }
  v56 = *(double *)(a1 + 48);
  if (v56 < CGRectGetMinX(*(CGRect *)(a1 + 64)) + *(double *)(a1 + 96))
  {
    v42 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1;
    v43 = 2;
LABEL_34:
    if (v42)
      return v43 + 1;
    else
      return v43;
  }
  v58 = *(double *)(a1 + 48);
  if (v58 > CGRectGetMaxX(*(CGRect *)(a1 + 64)) - *(double *)(a1 + 96))
  {
    v59 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1;
    v60 = 2;
    goto LABEL_41;
  }
  if (*(_BYTE *)(a1 + 112))
    return 1;
  if (v50 || v55)
    return *(_QWORD *)(a1 + 104);
  result = v48 ? 2 : 3;
  if (!v48 && !v49)
    return *(_QWORD *)(a1 + 104);
  return result;
}

uint64_t __72__SBDragAndDropWorkspaceTransaction__updateCurrentDropActionForSession___block_invoke_3(uint64_t a1, double a2, double a3, double a4, double a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, double a10, double a11)
{
  double MaxX;
  double MinX;
  double v25;
  double v26;
  int v27;
  int v29;
  BOOL v30;
  uint64_t v31;
  CGRect v34;
  CGRect v35;

  MaxX = CGRectGetMaxX(*(CGRect *)&a2);
  v34.origin.x = a6;
  v34.origin.y = a7;
  v34.size.width = a8;
  v34.size.height = a9;
  MinX = CGRectGetMinX(v34);
  v35.origin.x = a6;
  v35.origin.y = a7;
  v35.size.width = a8;
  v35.size.height = a9;
  v25 = CGRectGetMaxX(v35);
  v26 = *(double *)(a1 + 40);
  v27 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "layoutContainsRole:", 2);
  if (v26 >= a10 && v26 <= MaxX - a10)
  {
    if (v26 >= MinX + a11 && v26 <= v25 - a11)
      return *(unsigned __int8 *)(a1 + 56);
    v30 = v26 < MinX + a11 == (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1);
    v31 = 6;
  }
  else
  {
    v29 = v27;
    v30 = v26 < a10 == (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1);
    if (v29)
      v31 = 2;
    else
      v31 = 4;
  }
  if (v30)
    return v31 + 1;
  else
    return v31;
}

uint64_t __72__SBDragAndDropWorkspaceTransaction__updateCurrentDropActionForSession___block_invoke_4(uint64_t a1)
{
  double v2;
  unint64_t v3;

  objc_msgSend((id)objc_opt_class(), "prototypeSettingsContentDraggingFloatingActivationWidth");
  v3 = SBFloatingConfigurationForMovingFloatingApplication(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "floatingConfiguration"), *(void **)(*(_QWORD *)(a1 + 32) + 464), *(double *)(a1 + 40), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), v2, *(double *)(a1 + 88));
  if (v3 > 4)
    return 0;
  else
    return qword_1D0E89F10[v3];
}

- (BOOL)_showResizeUI
{
  _BOOL4 v3;
  _BOOL4 v4;

  v3 = self->_sessionState != 2
    && (self->_currentDropAction & 0xFFFFFFFFFFFFFFFELL) == 4
    && (!self->_layoutElementForWindowDrag || self->_windowDragEnteredPlatterZone);
  v4 = v3 & (-[SBDragAndDropWorkspaceTransaction isInterrupted](self, "isInterrupted") ^ 1);
  return self->_sceneUpdateTransactionForWindowDrag || v4;
}

- (id)_transitionRequestForDropAction:(int64_t)a3
{
  SBDragAndDropWorkspaceTransaction *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SBWorkspaceApplicationSceneTransitionContext *v17;
  SBDeviceApplicationSceneEntity *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  int *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD *v45;
  void *v46;
  SBDeviceApplicationSceneEntity *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  SBWorkspaceApplicationSceneTransitionContext *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  SBWorkspaceApplicationSceneTransitionContext *v59;
  uint64_t v60;
  void *v61;
  SBSwitcherDropRegionContext *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  SBLayoutElement *layoutElementForWindowDrag;
  void *v74;
  uint64_t v75;
  SBWorkspaceApplicationSceneTransitionContext *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  SBLayoutElement *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  SBMainDisplayLayoutState *currentLayoutState;
  void *v85;
  SBWorkspaceApplicationSceneTransitionContext *v86;
  SBWorkspaceApplicationSceneTransitionContext *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t i;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  unsigned int v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  id v117;
  void *v118;
  void *v119;
  void *v120;
  int64_t v121;
  uint64_t (**v122)(_QWORD, _QWORD, _QWORD);
  void *v123;
  SBDragAndDropWorkspaceTransaction *v124;
  void *v125;
  void *v126;
  SBWorkspaceApplicationSceneTransitionContext *v127;
  SBDeviceApplicationSceneEntity *v128;
  void *v129;
  id obj;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  _QWORD v135[4];
  id v136;
  _QWORD v137[6];
  _BYTE v138[128];
  SBDeviceApplicationSceneEntity *v139;
  SBDeviceApplicationSceneEntity *v140;
  _QWORD v141[2];
  _QWORD v142[2];
  _QWORD v143[3];

  v5 = self;
  v143[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  objc_msgSend(WeakRetained, "switcherCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "contentViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  v10 = v8;
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  -[SBWorkspaceTransaction transitionRequest](v5, "transitionRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "workspace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "displayConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "createRequestWithOptions:displayConfiguration:", 0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v120 = v13;
  objc_msgSend(v16, "setSource:", objc_msgSend(v13, "source"));
  objc_msgSend(v16, "setEventLabel:", CFSTR("DragAndDropAppActivation"));
  v17 = objc_alloc_init(SBWorkspaceApplicationSceneTransitionContext);
  -[SBWorkspaceApplicationSceneTransitionContext setDelegate:](v17, "setDelegate:", v5);
  v117 = v16;
  objc_msgSend(v16, "setApplicationContext:", v17);
  v18 = -[SBDeviceApplicationSceneEntity initWithApplicationSceneHandle:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationSceneHandle:", v5->_draggingApplicationSceneHandle);
  -[SBApplicationDropSession launchActions](v5->_dropSession, "launchActions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationSceneEntity addActions:](v18, "addActions:", v19);

  -[SBApplicationDropSession activationSettings](v5->_dropSession, "activationSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = v18;
  -[SBWorkspaceEntity applyActivationSettings:](v18, "applyActivationSettings:", v20);

  v21 = MEMORY[0x1E0C809B0];
  v137[0] = MEMORY[0x1E0C809B0];
  v137[1] = 3221225472;
  v137[2] = __69__SBDragAndDropWorkspaceTransaction__transitionRequestForDropAction___block_invoke;
  v137[3] = &unk_1E8EAA0B8;
  v137[4] = v5;
  v137[5] = a2;
  v122 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](v137);
  -[SBApplicationDropSession uiDragDropSession](v5->_dropSession, "uiDragDropSession");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "locationInView:", v23);
  v25 = v24;
  v27 = v26;

  v123 = v12;
  objc_msgSend(v12, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bounds");
  +[SBDisplayItemLayoutAttributes normalizedPointForPoint:inBounds:](SBDisplayItemLayoutAttributes, "normalizedPointForPoint:inBounds:", v25, v27, v29, v30, v31, v32);
  v34 = v33;
  v36 = v35;

  v37 = &OBJC_IVAR___SBInteractiveScreenshotGestureRootViewController__flashView;
  v125 = WeakRetained;
  v126 = v7;
  v124 = v5;
  v127 = v17;
  v121 = a3;
  switch(a3)
  {
    case 0:
      +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBWorkspaceApplicationSceneTransitionContext setEntities:withPolicy:centerEntity:floatingEntity:](v17, "setEntities:withPolicy:centerEntity:floatingEntity:", MEMORY[0x1E0C9AA60], 1, v38, v39);
      goto LABEL_13;
    case 1:
      v143[0] = v128;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v143, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBWorkspaceApplicationSceneTransitionContext setEntities:withPolicy:centerEntity:floatingEntity:](v17, "setEntities:withPolicy:centerEntity:floatingEntity:", v40, 0, 0, v41);

      if (!objc_msgSend(WeakRetained, "isChamoisWindowingUIEnabled"))
        goto LABEL_64;
      -[SBWorkspaceApplicationSceneTransitionContext _setRequestedFrontmostEntity:](v17, "_setRequestedFrontmostEntity:", v128);
      -[SBWorkspaceApplicationSceneTransitionContext requestedLayoutAttributesForEntity:](v17, "requestedLayoutAttributesForEntity:", v128);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "attributesByModifyingNormalizedCenter:", v34, v36);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBWorkspaceApplicationSceneTransitionContext setRequestedLayoutAttributes:forEntity:](v17, "setRequestedLayoutAttributes:forEntity:", v43, v128);
      goto LABEL_63;
    case 2:
      v142[0] = v128;
      +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:](SBPreviousWorkspaceEntity, "entityWithPreviousLayoutRole:", 2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v142[1] = v38;
      v44 = (void *)MEMORY[0x1E0C99D20];
      v45 = v142;
      goto LABEL_12;
    case 3:
      +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:](SBPreviousWorkspaceEntity, "entityWithPreviousLayoutRole:", 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v141[0] = v38;
      v141[1] = v128;
      v44 = (void *)MEMORY[0x1E0C99D20];
      v45 = v141;
LABEL_12:
      objc_msgSend(v44, "arrayWithObjects:count:", v45, 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBWorkspaceApplicationSceneTransitionContext setEntities:withPolicy:centerEntity:floatingEntity:](v127, "setEntities:withPolicy:centerEntity:floatingEntity:", v39, 0, 0, v46);

LABEL_13:
      goto LABEL_64;
    case 4:
      if (objc_msgSend(WeakRetained, "isChamoisWindowingUIEnabled"))
      {
        v47 = v128;
        v140 = v128;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v140, 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBWorkspaceApplicationSceneTransitionContext setEntities:startingAtLayoutRole:withPolicy:centerEntity:floatingEntity:](v127, "setEntities:startingAtLayoutRole:withPolicy:centerEntity:floatingEntity:", v48, 1, 1, v49, v50);

        v17 = v127;
        -[SBWorkspaceApplicationSceneTransitionContext _setRequestedFrontmostEntity:](v127, "_setRequestedFrontmostEntity:", v128);
        -[SBWorkspaceApplicationSceneTransitionContext requestedLayoutAttributesForEntity:](v127, "requestedLayoutAttributesForEntity:", v128);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "attributesByModifyingNormalizedCenter:", v34, v36);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        v53 = v127;
        goto LABEL_18;
      }
      layoutElementForWindowDrag = v5->_layoutElementForWindowDrag;
      if (!layoutElementForWindowDrag || v5->_windowDragEnteredPlatterZone)
      {
        -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v17, "setEntity:forLayoutRole:", v128, 1);
        -[SBLayoutState elementWithRole:](v5->_currentLayoutState, "elementWithRole:", 1);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "workspaceEntity");
        v75 = objc_claimAutoreleasedReturnValue();
        v76 = v17;
        v77 = (void *)v75;
        -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v76, "setEntity:forLayoutRole:", v75, 2);

        if (!v5->_layoutElementForWindowDrag
          || (v78 = SBLayoutRoleMaskAppLayout(),
              !SBLayoutRoleMaskContainsRole(v78, -[SBLayoutElement layoutRole](v5->_layoutElementForWindowDrag, "layoutRole"))))
        {
          v17 = v127;
          goto LABEL_42;
        }
        if (-[SBLayoutElement layoutRole](v5->_layoutElementForWindowDrag, "layoutRole") == 2)
        {
          v79 = v122[2](v122, -[SBMainDisplayLayoutState spaceConfiguration](v5->_initialLayoutState, "spaceConfiguration"), -[SBLayoutState interfaceOrientation](v5->_initialLayoutState, "interfaceOrientation"));
          goto LABEL_59;
        }
        v96 = 240;
        goto LABEL_58;
      }
      if (-[SBLayoutElement layoutRole](layoutElementForWindowDrag, "layoutRole") == 2)
      {
        -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v17, "setEntity:forLayoutRole:", v128, 1);
        -[SBLayoutState elementWithRole:](v5->_currentLayoutState, "elementWithRole:", 1);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "workspaceEntity");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v127, "setEntity:forLayoutRole:", v93, 2);

        v17 = v127;
        v83 = -[SBMainDisplayLayoutState spaceConfiguration](v5->_currentLayoutState, "spaceConfiguration");
        currentLayoutState = v5->_currentLayoutState;
        goto LABEL_49;
      }
      v97 = 248;
      goto LABEL_55;
    case 5:
      if (!objc_msgSend(WeakRetained, "isChamoisWindowingUIEnabled"))
      {
        v80 = v5->_layoutElementForWindowDrag;
        if (v80 && !v5->_windowDragEnteredPlatterZone)
        {
          if (-[SBLayoutElement layoutRole](v80, "layoutRole") != 1)
          {
            v96 = 248;
LABEL_58:
            v79 = objc_msgSend(*(id *)((char *)&v5->super.super.super.super.super.isa + v96), "spaceConfiguration");
LABEL_59:
            v88 = v79;
            v17 = v127;
LABEL_60:
            v87 = v17;
            goto LABEL_61;
          }
          +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:](SBPreviousWorkspaceEntity, "entityWithPreviousLayoutRole:", 2);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v127, "setEntity:forLayoutRole:", v95, 1);

          v17 = v127;
          -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v127, "setEntity:forLayoutRole:", v128, 2);
          v88 = v122[2](v122, -[SBMainDisplayLayoutState spaceConfiguration](v5->_currentLayoutState, "spaceConfiguration"), -[SBLayoutState interfaceOrientation](v5->_currentLayoutState, "interfaceOrientation"));
          v87 = v127;
        }
        else
        {
          +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:](SBPreviousWorkspaceEntity, "entityWithPreviousLayoutRole:", 1);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v17, "setEntity:forLayoutRole:", v81, 1);

          -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v17, "setEntity:forLayoutRole:", v128, 2);
          if (v5->_layoutElementForWindowDrag)
          {
            v82 = SBLayoutRoleMaskAppLayout();
            if (SBLayoutRoleMaskContainsRole(v82, -[SBLayoutElement layoutRole](v5->_layoutElementForWindowDrag, "layoutRole")))
            {
              if (-[SBLayoutElement layoutRole](v5->_layoutElementForWindowDrag, "layoutRole") == 1)
              {
                v83 = -[SBMainDisplayLayoutState spaceConfiguration](v5->_initialLayoutState, "spaceConfiguration");
                currentLayoutState = v5->_initialLayoutState;
LABEL_49:
                v94 = v122[2](v122, v83, -[SBLayoutState interfaceOrientation](currentLayoutState, "interfaceOrientation"));
              }
              else
              {
                v97 = 240;
LABEL_55:
                v94 = objc_msgSend(*(id *)((char *)&v5->super.super.super.super.super.isa + v97), "spaceConfiguration");
              }
              v88 = v94;
              goto LABEL_60;
            }
          }
LABEL_42:
          v87 = v17;
          v88 = 3;
        }
LABEL_61:
        -[SBWorkspaceApplicationSceneTransitionContext setRequestedSpaceConfiguration:](v87, "setRequestedSpaceConfiguration:", v88);
        goto LABEL_62;
      }
      v47 = v128;
      v139 = v128;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v139, 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBWorkspaceApplicationSceneTransitionContext setEntities:startingAtLayoutRole:withPolicy:centerEntity:floatingEntity:](v127, "setEntities:startingAtLayoutRole:withPolicy:centerEntity:floatingEntity:", v54, 2, 1, v55, v56);

      v17 = v127;
      -[SBWorkspaceApplicationSceneTransitionContext _setRequestedFrontmostEntity:](v127, "_setRequestedFrontmostEntity:", v128);
      -[SBWorkspaceApplicationSceneTransitionContext requestedLayoutAttributesForEntity:](v127, "requestedLayoutAttributesForEntity:", v128);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "attributesByModifyingNormalizedCenter:", v34, v36);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      v53 = v127;
LABEL_18:
      -[SBWorkspaceApplicationSceneTransitionContext setRequestedLayoutAttributes:forEntity:](v53, "setRequestedLayoutAttributes:forEntity:", v52, v47);

LABEL_62:
      +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:](SBPreviousWorkspaceEntity, "entityWithPreviousLayoutRole:", 3);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v17, "setEntity:forLayoutRole:", v43, 3);
LABEL_63:

LABEL_64:
      -[SBApplicationDropSession localContext](v5->_dropSession, "localContext");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_recentAppLayoutsController");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBApplicationSceneEntity application](v128, "application");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "bundleIdentifier");
      v129 = (void *)objc_claimAutoreleasedReturnValue();

      v133 = 0u;
      v134 = 0u;
      v131 = 0u;
      v132 = 0u;
      objc_msgSend(*(id *)((char *)&v5->super.super.super.super.super.isa + v37[925]), "elements");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v99 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v138, 16);
      if (v99)
      {
        v100 = v99;
        v101 = 0;
        v102 = *(_QWORD *)v132;
        do
        {
          for (i = 0; i != v100; ++i)
          {
            if (*(_QWORD *)v132 != v102)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v131 + 1) + 8 * i), "workspaceEntity");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v105 = objc_opt_class();
              SBSafeCast(v105, v104);
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v106, "application");
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v107, "bundleIdentifier");
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              v109 = objc_msgSend(v108, "isEqualToString:", v129);

              v101 += v109;
            }

          }
          v100 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v138, 16);
        }
        while (v100);
      }
      else
      {
        v101 = 0;
      }

      v110 = objc_msgSend(v119, "startLocation");
      -[SBApplicationDropSession launchActions](v124->_dropSession, "launchActions");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = objc_msgSend(v111, "count");

      v113 = -[SBApplicationDropSession dropZones](v124->_dropSession, "dropZones");
      if (!v112 && v110 != 12 && (v110 & 0xFFFFFFFFFFFFFFFELL) != 8 && v121 && !v113)
      {
        objc_msgSend(v118, "recentDisplayItemsForBundleIdentifier:includingHiddenAppLayouts:", v129, 0);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v114, "count") >= 2)
        {
          v115 = objc_msgSend(v114, "count");
          if (v121 == 1 && v115 - v101 >= 2)
          {
            -[SBWorkspaceApplicationSceneTransitionContext setRequestedAppExposeBundleID:](v127, "setRequestedAppExposeBundleID:", v129);
          }
          else if (v121 != 1)
          {
            -[SBWorkspaceApplicationSceneTransitionContext setRequestedWindowPickerRole:](v127, "setRequestedWindowPickerRole:", -[SBWorkspaceEntity layoutRole](v128, "layoutRole"));
          }
        }

      }
      -[SBWorkspaceApplicationSceneTransitionContext setPreferredInterfaceOrientation:](v127, "setPreferredInterfaceOrientation:", -[SBLayoutState interfaceOrientation](v124->_initialLayoutState, "interfaceOrientation"));

      return v117;
    case 6:
      +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBWorkspaceApplicationSceneTransitionContext setEntities:withPolicy:centerEntity:floatingEntity:](v17, "setEntities:withPolicy:centerEntity:floatingEntity:", MEMORY[0x1E0C9AA60], 1, v58, v128);

      v59 = v17;
      v60 = 1;
      goto LABEL_23;
    case 7:
      +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBWorkspaceApplicationSceneTransitionContext setEntities:withPolicy:centerEntity:floatingEntity:](v17, "setEntities:withPolicy:centerEntity:floatingEntity:", MEMORY[0x1E0C9AA60], 1, v61, v128);

      v59 = v17;
      v60 = 2;
      goto LABEL_23;
    case 8:
      v59 = v17;
      v60 = 3;
      goto LABEL_23;
    case 9:
      v59 = v17;
      v60 = 4;
LABEL_23:
      -[SBWorkspaceApplicationSceneTransitionContext setRequestedFloatingConfiguration:](v59, "setRequestedFloatingConfiguration:", v60);
      goto LABEL_64;
    case 10:
      v62 = v5->_currentSwitcherDropRegionContext;
      v63 = -[SBSwitcherDropRegionContext currentDropRegion](v62, "currentDropRegion");
      -[SBSwitcherDropRegionContext draggingLeafAppLayout](v62, "draggingLeafAppLayout");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appLayouts");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v135[0] = v21;
      v135[1] = 3221225472;
      v135[2] = __69__SBDragAndDropWorkspaceTransaction__transitionRequestForDropAction___block_invoke_2;
      v135[3] = &unk_1E8E9DF78;
      v66 = v64;
      v136 = v66;
      objc_msgSend(v65, "bs_firstObjectPassingTest:", v135);
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      if ((v63 & 0xFFFFFFFFFFFFFFFELL) == 4)
      {
        objc_msgSend(v67, "itemForLayoutRole:", 1);
        v68 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "itemForLayoutRole:", 2);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "_entityForDisplayItem:switcherController:", v68, WeakRetained);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "_entityForDisplayItem:switcherController:", v69, WeakRetained);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v127, "setEntity:forLayoutRole:", v70, 1);
        -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v127, "setEntity:forLayoutRole:", v71, 2);
        v72 = (void *)v68;
        v37 = &OBJC_IVAR___SBInteractiveScreenshotGestureRootViewController__flashView;
        -[SBWorkspaceApplicationSceneTransitionContext setRequestedSpaceConfiguration:](v127, "setRequestedSpaceConfiguration:", SBMainDisplayLayoutStateSpaceConfigurationFromAppLayoutConfiguration(objc_msgSend(v67, "configuration")));

      }
      else
      {
        if (v63 == 6)
        {
          objc_msgSend(v67, "itemForLayoutRole:", 1);
          v89 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v126, "_entityForDisplayItem:switcherController:", v89, WeakRetained);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v127, "setEntity:forLayoutRole:", v69, 3);
          +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v127, "setEntity:forLayoutRole:", v90, 1);

          v72 = (void *)v89;
          v37 = &OBJC_IVAR___SBInteractiveScreenshotGestureRootViewController__flashView;
          +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v127, "setEntity:forLayoutRole:", v91, 2);

          v86 = v127;
        }
        else
        {
          if (v63 != 3)
            goto LABEL_46;
          objc_msgSend(v67, "itemForLayoutRole:", 1);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v126, "_entityForDisplayItem:switcherController:", v72, WeakRetained);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v127, "setEntity:forLayoutRole:", v69, 1);
          +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBWorkspaceApplicationSceneTransitionContext setEntity:forLayoutRole:](v127, "setEntity:forLayoutRole:", v85, 2);

          v86 = v127;
        }
        -[SBWorkspaceApplicationSceneTransitionContext setRequestedSpaceConfiguration:](v86, "setRequestedSpaceConfiguration:", 1);
      }

LABEL_46:
      -[SBWorkspaceApplicationSceneTransitionContext setRequestedUnlockedEnvironmentMode:](v127, "setRequestedUnlockedEnvironmentMode:", 2);

      v7 = v126;
      v5 = v124;
      goto LABEL_64;
    default:
      goto LABEL_64;
  }
}

unint64_t __69__SBDragAndDropWorkspaceTransaction__transitionRequestForDropAction___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v4 = SBSpaceConfigurationForSpaceConfigurationAndInterfaceOrientation(a2, a3);
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = a1 + 32;
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(v8 + 8);
      SBStringForSpaceConfiguration(v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v7, v6, CFSTR("SBDragAndDropWorkspaceTransaction.m"), 2514, CFSTR("Can't swap primary/side in space configuration: %@"), v9);

      break;
    case 2uLL:
      v4 = 4;
      break;
    case 3uLL:
      v4 = 3;
      break;
    case 4uLL:
      v4 = 2;
      break;
    default:
      return v4;
  }
  return v4;
}

uint64_t __69__SBDragAndDropWorkspaceTransaction__transitionRequestForDropAction___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "itemForLayoutRole:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "containsItemWithUniqueIdentifier:", v5);

  return v6;
}

- (CGSize)_sizeForFloatingApplication
{
  CGSize *p_cachedSizeForFloatingApplication;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  double width;
  double height;
  CGSize result;

  p_cachedSizeForFloatingApplication = &self->_cachedSizeForFloatingApplication;
  if (BSSizeEqualToSize())
  {
    -[SBWorkspaceTransaction layoutStateTransitionCoordinator](self, "layoutStateTransitionCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sceneEntityFrameProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBDragAndDropWorkspaceTransaction _transitionRequestForDropAction:](self, "_transitionRequestForDropAction:", 7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finalize");
    objc_msgSend(v6, "applicationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "elementWithRole:", 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "workspaceEntity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sceneEntityFrameForWorkspaceEntity:inLayoutState:", v10, v8);
    p_cachedSizeForFloatingApplication->width = v11;
    p_cachedSizeForFloatingApplication->height = v12;

  }
  width = p_cachedSizeForFloatingApplication->width;
  height = p_cachedSizeForFloatingApplication->height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_cleanUpAndCompleteTransactionIfNecessary
{
  NSObject *v3;
  SBApplicationDropSession *dropSession;
  int v5;
  SBApplicationDropSession *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogMedusaDropDestination();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    dropSession = self->_dropSession;
    v5 = 138543362;
    v6 = dropSession;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "SBAppDrop transaction _cleanUpAndCompleteTransactionIfNecessary for session %{public}@", (uint8_t *)&v5, 0xCu);
  }

  -[SBDragAndDropWorkspaceTransaction _updatePlatterPreviewForSetDown:animated:](self, "_updatePlatterPreviewForSetDown:animated:", 0, 1);
}

- (void)_configurePlatterPreview:(id)a3 forSceneHandle:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  SBMutableDeviceApplicationScenePlaceholderContentContext *v12;
  int64_t v13;
  SBMainDisplayLayoutState *currentLayoutState;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  id v30;

  v30 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v30, "platterView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(v30, "sourceView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v30, "configurePlatterForSceneHandle:withTargetView:completion:", v8, v11, v9);
    }
    else
    {
      v12 = -[SBDeviceApplicationScenePlaceholderContentContext initWithActivationSettings:]([SBMutableDeviceApplicationScenePlaceholderContentContext alloc], "initWithActivationSettings:", 0);
      -[SBDeviceApplicationScenePlaceholderContentContext setPreferredContentType:](v12, "setPreferredContentType:", 1);
      v13 = -[SBLayoutState interfaceOrientation](self->_currentLayoutState, "interfaceOrientation");
      currentLayoutState = self->_currentLayoutState;
      objc_msgSend(v8, "sceneIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[SBLayoutState interfaceOrientationForElementIdentifier:](currentLayoutState, "interfaceOrientationForElementIdentifier:", v15);

      -[SBWorkspaceTransaction displayConfiguration](self, "displayConfiguration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pointScale");
      v19 = v18;

      objc_msgSend(v8, "mostRecentSceneSnapshotsForScale:launchingOrientation:", v16, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBDragAndDropWorkspaceTransaction _sizeForFloatingApplication](self, "_sizeForFloatingApplication");
      v22 = v21;
      v24 = v23;
      if (objc_msgSend(v20, "count"))
      {
        objc_msgSend(v20, "sortedArrayUsingComparator:", &__block_literal_global_202);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "firstObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "referenceSize");
        v22 = v27;
        v24 = v28;

        v20 = v25;
      }
      v29 = (void *)objc_msgSend(v8, "newSceneViewWithReferenceSize:contentOrientation:containerOrientation:hostRequester:", v16, v13, 0, v22, v24);
      objc_msgSend(v29, "setPlaceholderContentContext:", v12);
      objc_msgSend(v29, "setDisplayMode:animationFactory:completion:", 2, 0, 0);
      objc_msgSend(v30, "configurePlatterForSceneHandle:withTargetView:completion:", v8, v29, v9);

    }
  }

}

uint64_t __88__SBDragAndDropWorkspaceTransaction__configurePlatterPreview_forSceneHandle_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(a2, "referenceSize");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "referenceSize");
  v10 = v9;
  v12 = v11;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6 * v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10 * v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "compare:", v14);

  return v15;
}

- (void)_updateAnchorPointForPlatterPreview:(id)a3 dragPreview:(id)a4 withSourceViewBounds:(CGRect)a5 location:(CGPoint)a6
{
  double y;
  double x;
  double height;
  double width;
  SBLayoutElement *layoutElementForWindowDrag;
  id v14;
  id v15;
  uint64_t v16;
  SBMedusaSettings *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  SBMedusaSettings *v26;

  y = a6.y;
  x = a6.x;
  height = a5.size.height;
  width = a5.size.width;
  v26 = self->_medusaSettings;
  layoutElementForWindowDrag = self->_layoutElementForWindowDrag;
  v14 = a4;
  v15 = a3;
  v16 = -[SBLayoutElement layoutRole](layoutElementForWindowDrag, "layoutRole");
  if (v16 == 3)
    goto LABEL_2;
  v19 = v16;
  v20 = SBSpaceConfigurationForSpaceConfigurationAndInterfaceOrientation(-[SBMainDisplayLayoutState spaceConfiguration](self->_currentLayoutState, "spaceConfiguration"), -[SBLayoutState interfaceOrientation](self->_currentLayoutState, "interfaceOrientation"));
  if (v20 == 2)
  {
    v17 = v26;
    if (v19 == 1)
      goto LABEL_3;
    goto LABEL_12;
  }
  if (v20 == 4)
  {
    if (v19 != 1)
    {
LABEL_2:
      v17 = v26;
LABEL_3:
      -[SBMedusaSettings narrowEdgeSwipeHitTestWidth](v17, "narrowEdgeSwipeHitTestWidth");
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  v18 = 0.0;
  if (v20 == 3)
  {
LABEL_11:
    v17 = v26;
LABEL_12:
    -[SBMedusaSettings wideEdgeSwipeHitTestWidth](v17, "wideEdgeSwipeHitTestWidth");
  }
LABEL_13:
  v21 = v18 * 0.5;
  v22 = width * 0.5 + v21;
  v23 = width * 0.5 - v21;
  if (v23 < x)
    v23 = x;
  if (v22 <= v23)
    v24 = v22;
  else
    v24 = v23;
  +[SBNubView height](SBNubView, "height");
  if (y > v25)
    y = v25;
  objc_msgSend(v14, "setLiftAnchorPoint:", v24, y);

  objc_msgSend(v15, "setAnchorPoint:", v24 / width, y / height);
}

- (int64_t)_layoutRoleForDropAction:(int64_t)a3
{
  int64_t *v3;
  int64_t result;
  SBLayoutElement *layoutElementForWindowDrag;

  switch(a3)
  {
    case 0:
      layoutElementForWindowDrag = self->_layoutElementForWindowDrag;
      if (!layoutElementForWindowDrag)
      {
        v3 = &SBLayoutRoleUndefined;
        goto LABEL_5;
      }
      return -[SBLayoutElement layoutRole](layoutElementForWindowDrag, "layoutRole");
    case 1:
    case 2:
    case 4:
    case 10:
      v3 = &SBLayoutRolePrimary;
      goto LABEL_5;
    case 3:
    case 5:
      v3 = &SBLayoutRoleSide;
      goto LABEL_5;
    case 6:
    case 7:
    case 8:
    case 9:
      v3 = &SBLayoutRoleFloating;
LABEL_5:
      result = *v3;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)_createPlatterPreviewForApplication:(id)a3 withSourceView:(id)a4 dropSession:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  SBAppPlatterDragPreview *v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[SBDragAndDropWorkspaceTransaction _iconManager](self, "_iconManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "iconModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isWebApplication"))
  {
    objc_msgSend(v11, "localContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "draggedSceneIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[SBWebApplication _webClipIdentifierFromWebAppIdentifier:](SBWebApplication, "_webClipIdentifierFromWebAppIdentifier:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "leafIconForIdentifier:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v9, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "applicationIconForBundleIdentifier:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDragAndDropWorkspaceTransaction.m"), 2871, CFSTR("icon must exist for application identifier %@"), v34);

  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA620]), "initWithConfigurationOptions:", 6);
  objc_msgSend(v18, "setLocation:", *MEMORY[0x1E0DAA9E8]);
  objc_msgSend(v12, "listLayoutProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setListLayoutProvider:", v19);

  objc_msgSend(v18, "setDelegate:", v12);
  objc_msgSend(v18, "setIcon:", v17);
  objc_msgSend(v18, "setEnabled:", 0);
  v20 = -[SBAppPlatterDragPreview initWithReferenceIconView:sourceView:]([SBAppPlatterDragPreview alloc], "initWithReferenceIconView:sourceView:", v18, v10);
  -[SBAppPlatterDragPreview setAlpha:](v20, "setAlpha:", 0.0);
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __100__SBDragAndDropWorkspaceTransaction__createPlatterPreviewForApplication_withSourceView_dropSession___block_invoke;
  v35[3] = &unk_1E8EACB70;
  v21 = v12;
  v36 = v21;
  -[SBAppPlatterDragPreview setCleanUpHandler:](v20, "setCleanUpHandler:", v35);
  objc_msgSend(v21, "iconDragManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceTransaction windowScene](self, "windowScene");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addPlatterViewToMedusaDragOffscreenWindow:forWindowScene:", v20, v23);

  if (v10)
  {
    objc_msgSend(v10, "bounds");
    UIRectGetCenter();
    v25 = v24;
    v27 = v26;
    -[SBAppPlatterDragPreview window](v20, "window");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v10;
  }
  else
  {
    objc_msgSend(v18, "iconImageCenter");
    v25 = v30;
    v27 = v31;
    objc_msgSend(v18, "window");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v18;
  }
  objc_msgSend(v29, "convertPoint:toView:", v28, v25, v27);
  -[SBAppPlatterDragPreview setCenter:](v20, "setCenter:");

  return v20;
}

void __100__SBDragAndDropWorkspaceTransaction__createPlatterPreviewForApplication_withSourceView_dropSession___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "iconDragManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removePlatterViewFromMedusaDragOffscreenWindow:", v3);

}

- (void)_updateCurrentDropActionProposedLayoutState
{
  void *v3;
  SBMainDisplayLayoutState *v4;
  SBMainDisplayLayoutState *currentDropActionProposedLayoutState;
  id v6;

  -[SBDragAndDropWorkspaceTransaction _transitionRequestForDropAction:](self, "_transitionRequestForDropAction:", self->_currentDropAction);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finalize");
  objc_msgSend(v6, "applicationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutState");
  v4 = (SBMainDisplayLayoutState *)objc_claimAutoreleasedReturnValue();
  currentDropActionProposedLayoutState = self->_currentDropActionProposedLayoutState;
  self->_currentDropActionProposedLayoutState = v4;

}

- (id)resizeUIAnimationFactory
{
  return (id)objc_msgSend(MEMORY[0x1E0D01908], "factoryWithDuration:", 0.25);
}

- (id)_iconManager
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[SBWorkspaceTransaction windowScene](self, "windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeScreenController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "iconManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)layoutStateForApplicationTransitionContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBWorkspaceTransaction layoutStateTransitionCoordinator](self, "layoutStateTransitionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutStateForApplicationTransitionContext:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)previousLayoutStateForApplicationTransitionContext:(id)a3
{
  return self->_currentLayoutState;
}

- (CGRect)applicationTransitionContext:(id)a3 frameForApplicationSceneEntity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applicationTransitionContext:frameForApplicationSceneEntity:", v6, v5);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)transaction:(id)a3 didCommitSceneUpdate:(id)a4
{
  id v5;

  v5 = a3;
  if (-[NSMutableSet count](self->_pendingSceneUpdatesTransactions, "count"))
  {
    -[NSMutableSet removeObject:](self->_pendingSceneUpdatesTransactions, "removeObject:", v5);
    if (!-[NSMutableSet count](self->_pendingSceneUpdatesTransactions, "count"))
      -[SBDragAndDropWorkspaceTransaction _updatePlatterPreviewForSetDown:animated:](self, "_updatePlatterPreviewForSetDown:animated:", 1, 1);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_dragAndDropGesture, 0);
  objc_storeStrong((id *)&self->_gestureID, 0);
  objc_storeStrong((id *)&self->_chamoisSettings, 0);
  objc_storeStrong((id *)&self->_medusaSettings, 0);
  objc_storeStrong((id *)&self->_touchHistory, 0);
  objc_storeStrong((id *)&self->_deferOrientationUpdatesForDragAndDropAssertion, 0);
  objc_storeStrong((id *)&self->_contentDragPreview, 0);
  objc_storeStrong((id *)&self->_activeSourceViewProvider, 0);
  objc_storeStrong((id *)&self->_activePlatterPreview, 0);
  objc_storeStrong((id *)&self->_pendingSceneUpdatesTransactions, 0);
  objc_storeStrong((id *)&self->_displayLinkForWindowDrag, 0);
  objc_storeStrong((id *)&self->_sceneUpdateTransactionForWindowDrag, 0);
  objc_storeStrong((id *)&self->_layoutElementForWindowDrag, 0);
  objc_storeStrong((id *)&self->_currentDropActionProposedLayoutState, 0);
  objc_storeStrong((id *)&self->_currentSwitcherDropRegionContext, 0);
  objc_storeStrong((id *)&self->_currentWorkspaceTransaction, 0);
  objc_storeStrong((id *)&self->_dropTransitionRequest, 0);
  objc_storeStrong((id *)&self->_draggingApplicationSceneHandle, 0);
  objc_storeStrong((id *)&self->_dropSession, 0);
  objc_storeStrong((id *)&self->_finalLayoutState, 0);
  objc_storeStrong((id *)&self->_currentLayoutState, 0);
  objc_storeStrong((id *)&self->_initialLayoutState, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_sceneManager);
  objc_destroyWeak((id *)&self->_switcherContentController);
  objc_destroyWeak((id *)&self->_switcherController);
}

- (void)_addChildWorkspaceTransaction:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "Adding child transaction: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_updateCurrentDropActionForSession:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, a1, a3, "SBAppDrop Disallowing drop because dragging to Medusa space while a center window is active is not supported.", a5, a6, a7, a8, 0);
}

- (void)_updateCurrentDropActionForSession:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, a1, a3, "SBAppDrop Disallowing drop because a folder in the dock is open.", a5, a6, a7, a8, 0);
}

@end
