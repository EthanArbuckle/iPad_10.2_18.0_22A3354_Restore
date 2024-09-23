@implementation UICollectionLayoutSectionListSolver

void __63___UICollectionLayoutSectionListSolver__resolveWithParameters___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  double *v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  CGRect *v17;
  double v18;
  double v19;
  double Height;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat Width;
  double *v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  id v30;
  BOOL v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _UICollectionPreferredSizes *v44;
  id v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  void *v64;
  uint64_t v65;
  char **v66;
  unint64_t v67;
  char *v68;
  char *v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  void **v78;
  void **v79;
  char *v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  void **v84;
  void **v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  id *v90;
  _UICollectionPreferredSizes *v91;
  char **v92;
  id obj;
  char **v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint64_t v99;
  id v100[5];
  void **v101[5];
  _BYTE v102[96];
  uint64_t v103;
  uint64_t v104;
  id v105;
  uint64_t v106;
  _NSRange v107;
  _NSRange v108;
  _NSRange v109;
  CGRect v110;
  CGRect v111;

  v106 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    -[_UICollectionPreferredSizes objectAtIndexedSubscript:](*(_QWORD *)(v2 + 96), a2);
    v90 = (id *)objc_claimAutoreleasedReturnValue();
    if (v90)
    {
      v5 = *(_QWORD *)(v2 + 8);
      v4 = (uint64_t *)(v2 + 8);
      v6 = *(_QWORD *)(v2 + 16) - v5;
      if (!v6
        || (v7 = -[_UICollectionLayoutSectionListSolver _regionIndexForFrameIndex:startRegionIndex:endRegionIndex:](v2, a2, 0x86BCA1AF286BCA1BLL * (v6 >> 3) - 1), v7 == 0x7FFFFFFFFFFFFFFFLL))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel__updatePreferredSizeForFrameIndex_, v2, CFSTR("_UICollectionLayoutSectionListSolver.mm"), 715, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("regionIndex != NSNotFound"), v90);

        v5 = *v4;
        v8 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        v8 = v7;
      }
      v10 = *(_QWORD *)(v5 + 152 * v8 + 8);
      if (v10 >= 2)
      {
        v11 = (double *)(v5 + 152 * v8);
        v12 = *v11;
        v14 = v11[2];
        v13 = v11[3];
        if (a2 == *(_QWORD *)v11)
        {
          *(_QWORD *)v11 = a2 + 1;
          *((_QWORD *)v11 + 1) = v10 - 1;
          v107.location = a2;
          v107.length = 1;
          _UIRegionSolveResult::_UIRegionSolveResult((_UIRegionSolveResult *)v102, v107, v14, v13, *(const _UIItemSolveResult **)(v2 + 32));
          std::vector<_UIRegionSolveResult>::insert((uint64_t *)(v2 + 8), *v4 + 152 * v8, (unint64_t)v102);

        }
        else
        {
          *((_QWORD *)v11 + 1) = a2 - *(_QWORD *)v11;
          v108.location = a2;
          v108.length = 1;
          _UIRegionSolveResult::_UIRegionSolveResult((_UIRegionSolveResult *)v102, v108, v14, v13, *(const _UIItemSolveResult **)(v2 + 32));
          ++v8;
          std::vector<_UIRegionSolveResult>::insert((uint64_t *)(v2 + 8), *v4 + 152 * v8, (unint64_t)v102);
          v109.location = a2 + 1;
          v109.length = v10 + ~a2 + *(_QWORD *)&v12;
          _UIRegionSolveResult::_UIRegionSolveResult((_UIRegionSolveResult *)&v95, v109, v14, v13, *(const _UIItemSolveResult **)(v2 + 32));
          std::vector<_UIRegionSolveResult>::insert((uint64_t *)(v2 + 8), *v4 + 152 * v8 + 152, (unint64_t)&v95);

          v101[0] = v100;
          std::vector<_UIAuxillarySolveResult>::__destroy_vector::operator()[abi:nn180100](v101);
          v101[0] = (void **)&v99;
          std::vector<_UIAuxillarySolveResult>::__destroy_vector::operator()[abi:nn180100](v101);

        }
        *(_QWORD *)&v95 = &v104;
        std::vector<_UIAuxillarySolveResult>::__destroy_vector::operator()[abi:nn180100]((void ***)&v95);
        *(_QWORD *)&v95 = &v103;
        std::vector<_UIAuxillarySolveResult>::__destroy_vector::operator()[abi:nn180100]((void ***)&v95);
        if (v8 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "handleFailureInMethod:object:file:lineNumber:description:", sel__updatePreferredSizeForFrameIndex_, v2, CFSTR("_UICollectionLayoutSectionListSolver.mm"), 721, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("regionIndexToUpdate != NSNotFound"));

          v8 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      v15 = *(_QWORD *)(v2 + 8);
      v16 = *(_QWORD *)(v2 + 56);
      v17 = (CGRect *)(v15 + 152 * v8);
      -[_UICollectionPreferredSize fittingSize]((uint64_t)v90);
      v19 = v18;
      v110.origin.x = v17[1].origin.x;
      v110.origin.y = v17[1].origin.y;
      ++v17;
      v110.size.width = v17->size.width;
      v110.size.height = v17->size.height;
      Height = CGRectGetHeight(v110);
      MinX = CGRectGetMinX(*v17);
      MinY = CGRectGetMinY(*v17);
      Width = CGRectGetWidth(*v17);
      v17->origin.x = MinX;
      v17->origin.y = MinY;
      v17->size.width = Width;
      v17->size.height = v19;
      v24 = (double *)(v15 + 152 * v8);
      v25 = v24[11];
      v24 += 11;
      v111.size.height = v25;
      v111.origin.x = *(v24 - 3);
      v111.origin.y = *(v24 - 2);
      v111.size.width = *(v24 - 1);
      v26 = CGRectGetMinX(v111);
      v27 = CGRectGetMinY(*(CGRect *)(v24 - 3));
      v28 = CGRectGetWidth(*(CGRect *)(v24 - 3));
      v29 = CGRectGetHeight(*(CGRect *)(v24 - 3));
      *(v24 - 3) = v26;
      *(v24 - 2) = v27;
      *(v24 - 1) = v28;
      *v24 = v19 - Height + v29;
      if (fabs(v19 - Height) < 2.22044605e-16)
      {
        v30 = v90[7];
        v31 = v30 == 0;

        if (v16)
          v32 = v31;
        else
          v32 = 1;
        if ((v32 & 1) != 0)
          goto LABEL_62;
      }
      else if (!v16)
      {
        goto LABEL_62;
      }
      v33 = *(_QWORD *)(v16 + 48);
      if (!v33 || !*(_QWORD *)(v33 + 64))
        goto LABEL_62;
      v34 = v15 + 152 * v8;
      v37 = *(_QWORD *)(v34 + 104);
      v35 = (_QWORD *)(v34 + 104);
      v36 = v37;
      v38 = *(v35 - 1);
      v92 = (char **)(v35 - 1);
      while (v36 != v38)
      {

        v36 -= 48;
      }
      *v35 = v38;
      v39 = v15 + 152 * v8;
      v42 = *(_QWORD *)(v39 + 128);
      v40 = (_QWORD *)(v39 + 128);
      v41 = v42;
      v43 = *(v40 - 1);
      v94 = (char **)(v40 - 1);
      while (v41 != v43)
      {

        v41 -= 48;
      }
      *v40 = v43;
      v44 = objc_alloc_init(_UICollectionPreferredSizes);
      -[_UICollectionPreferredSizes setObject:atIndexedSubscript:]((uint64_t)v44, (uint64_t)v90, 0);
      v45 = *(id *)(v16 + 24);
      v46 = *(_QWORD *)(v16 + 88);
      v47 = *(id *)(v16 + 32);
      -[_UICollectionLayoutItemSolver _solveForContainer:layoutAxis:traitCollection:maxFrameCount:layoutRTL:preferredSizes:largestKnownItemSize:solutionRecursionDepth:](v16, v45, v46, v47, 0x7FFFFFFFFFFFFFFFLL, *(_BYTE *)(v16 + 8), v44, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));

      v48 = *(_QWORD *)(v16 + 48);
      v91 = v44;
      if (!v48 || *(_QWORD *)(v48 + 56) != 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _UIItemSolveResult::resolveAuxillaryResultsForFramePreferredSize(_UICollectionPreferredSize *const __strong, _UICollectionLayoutItemSolver *const __strong)");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "handleFailureInFunction:file:lineNumber:description:", v89, CFSTR("_UICollectionLayoutSectionListSolver.mm"), 149, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("solution.itemFrameCount == 1"));

      }
      -[_UICollectionLayoutItemSolver itemFrames](v16);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "objectAtIndexedSubscript:", 0);
      v50 = objc_claimAutoreleasedReturnValue();
      v51 = v15 + 152 * v8;
      v52 = *(void **)(v51 + 144);
      *(_QWORD *)(v51 + 144) = v50;

      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      -[_UICollectionLayoutItemSolver auxillaryFrames](v16);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      obj = v53;
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v95, v102, 16);
      if (v54)
      {
        v55 = *(_QWORD *)v96;
        do
        {
          v56 = 0;
          do
          {
            if (*(_QWORD *)v96 != v55)
              objc_enumerationMutation(obj);
            v57 = *(_QWORD **)(*((_QWORD *)&v95 + 1) + 8 * v56);
            if (v57)
            {
              v59 = v57[8];
              v58 = v57[9];
              v61 = v57[10];
              v60 = v57[11];
              v62 = v57[2];
              v63 = v57;
              v64 = v63;
              v65 = v63[7];
              v66 = v94;
              if (v65 != 3)
              {
                if (v65 != 4)
                  goto LABEL_57;
                v66 = v92;
              }
              v67 = (unint64_t)v66[2];
              v68 = v66[1];
              if ((unint64_t)v68 >= v67)
              {
                v70 = 0xAAAAAAAAAAAAAAABLL * ((v68 - *v66) >> 4);
                v71 = v70 + 1;
                if (v70 + 1 > 0x555555555555555)
                  abort();
                v72 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v67 - (_QWORD)*v66) >> 4);
                if (2 * v72 > v71)
                  v71 = 2 * v72;
                if (v72 >= 0x2AAAAAAAAAAAAAALL)
                  v73 = 0x555555555555555;
                else
                  v73 = v71;
                v101[4] = (void **)(v66 + 2);
                if (v73)
                {
                  v74 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_UIAuxillarySolveResult>>(v73);
                  v76 = v75;
                }
                else
                {
                  v74 = 0;
                  v76 = 0;
                }
                v77 = &v74[48 * v70];
                *(_QWORD *)v77 = v59;
                *((_QWORD *)v77 + 1) = v58;
                *((_QWORD *)v77 + 2) = v61;
                *((_QWORD *)v77 + 3) = v60;
                *((_QWORD *)v77 + 4) = v62;
                *((_QWORD *)v77 + 5) = v64;
                v79 = (void **)*v66;
                v78 = (void **)v66[1];
                if (v78 == (void **)*v66)
                {
                  v84 = (void **)v66[1];
                  v80 = v77;
                }
                else
                {
                  v80 = v77;
                  do
                  {
                    v81 = *((_OWORD *)v78 - 3);
                    v82 = *((_OWORD *)v78 - 2);
                    *((_QWORD *)v80 - 2) = *(v78 - 2);
                    *((_OWORD *)v80 - 3) = v81;
                    *((_OWORD *)v80 - 2) = v82;
                    v83 = (uint64_t)*(v78 - 1);
                    *(v78 - 1) = 0;
                    *((_QWORD *)v80 - 1) = v83;
                    v80 -= 48;
                    v78 -= 6;
                  }
                  while (v78 != v79);
                  v84 = (void **)*v66;
                  v78 = (void **)v66[1];
                }
                v69 = v77 + 48;
                *v66 = v80;
                v101[0] = v84;
                v101[1] = v84;
                v66[1] = v77 + 48;
                v101[2] = v78;
                v85 = (void **)v66[2];
                v66[2] = &v74[48 * v76];
                v101[3] = v85;
                std::__split_buffer<_UIAuxillarySolveResult>::~__split_buffer((uint64_t)v101);
                v44 = v91;
              }
              else
              {
                *(_QWORD *)v68 = v59;
                *((_QWORD *)v68 + 1) = v58;
                *((_QWORD *)v68 + 2) = v61;
                *((_QWORD *)v68 + 3) = v60;
                *((_QWORD *)v68 + 4) = v62;
                *((_QWORD *)v68 + 5) = v63;
                v69 = v68 + 48;
              }
              v66[1] = v69;
            }
LABEL_57:

            ++v56;
          }
          while (v56 != v54);
          v53 = obj;
          v86 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v102, 16);
          v54 = v86;
        }
        while (v86);
      }

    }
LABEL_62:

  }
}

@end
