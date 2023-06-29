@echo off
echo -----------------------------------------------------------------------------
echo -                         Installing Needed Apps                            -
echo -----------------------------------------------------------------------------

winget install --id Git.Git -e --source winget
winget install --id=Python.Python.3.10  -e

pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

cls
echo -----------------------------------------------------------------------------
echo -            Would you like to download large files now? (y/n)              -
echo -                (you will download the large files later)                  -
echo -----------------------------------------------------------------------------
set /p download_prompt=Enter Here:

if %download_prompt% == "y" goto download_large
if %download_prompt% == "n" goto download_small



:download_large
cls
echo -----------------------------------------------------------------------------
echo -                          Downloading All Files                            -
echo -----------------------------------------------------------------------------
git lfs install
cls
git clone https://huggingface.co/damo-vilab/modelscope-damo-text-to-video-synthesis
cls
goto install

:download_small
cls
echo -----------------------------------------------------------------------------
echo -                        Downloading Small Files                            -
echo -----------------------------------------------------------------------------
git lfs install
cls
GIT_LFS_SKIP_SMUDGE=1 git clone https://huggingface.co/damo-vilab/modelscope-damo-text-to-video-synthesis
cls
goto install



:install
echo -----------------------------------------------------------------------------
echo -                              Installing...                                -
echo -----------------------------------------------------------------------------
pip install modelscope==1.4.2
pip install open_clip_torch
pip install pytorch-lightning
cls
echo -----------------------------------------------------------------------------
echo -                  please launch generate.py to begin                       -
echo -----------------------------------------------------------------------------
pause




