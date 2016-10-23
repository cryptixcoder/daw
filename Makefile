#  _____     _   _ _____               _
# |   __|___|_|_| |   __|___ _ _ ___ _| |
# |  |  |  _| | . |__   | . | | |   | . |
# |_____|_| |_|___|_____|___|___|_|_|___|.com
#

CSS_DIR       = css/
SASS_FILE     = style.scss
CSS_FILE      = style.css
TPL_DIR       = templates/
TPL_FILE      = $(TPL_DIR)__precompiled.js
JS_FILE       = compressed.js
WEBAUDIO_PATH = ../webaudio-library/src/

all:
	@head -5 Makefile
	@make css
	@make html

html:
	@echo ":: HTML"
	@handlebars $(TPL_DIR) -f $(TPL_FILE)
	@make js

js:
	@echo ":: JS"
	@uglifyjs $(src) -o $(JS_FILE) --compress --mangle

css:
	@echo ":: CSS"
	@cd $(CSS_DIR); \
		tail -n +3 $(SASS_FILE) > ___tmp.scss; \
		sass ___tmp.scss $(CSS_FILE); \
		rm ___tmp.scss;

clean:
	rm -f $(JS_FILE) $(CSS_DIR)$(CSS_FILE) $(TPL_FILE)

.PHONY: all html css js clean

src = \
	jstools/keyboardRouter.min.js          \
	jstools/wisdom.js                      \
	jstools/handlebars.runtime.min.js      \
	$(TPL_FILE)                            \
	                                  \
	$(WEBAUDIO_PATH)walcontext.js     \
	$(WEBAUDIO_PATH)composition.js    \
	$(WEBAUDIO_PATH)buffer.js         \
	$(WEBAUDIO_PATH)waveform.js       \
	$(WEBAUDIO_PATH)filters.js        \
	$(WEBAUDIO_PATH)sample.js         \
	                                  \
	gs/_init.js                       \
	gs/loop.js                        \
	gs/playPauseStop.js               \
	gs/history/history.js             \
	gs/history/actions.js             \
	                                  \
	ui/ui.js                          \
	ui/btnMagnet.js                   \
	ui/btnPlay.js                     \
	ui/btnSave.js                     \
	ui/btnStop.js                     \
	ui/btnUndo.js                     \
	ui/btnRedo.js                     \
	ui/clock.js                       \
	ui/currentTimeCursor.js           \
	ui/historyList.js                 \
	ui/timeline.js                    \
	ui/timelineBeats.js               \
	ui/timelineLoop.js                \
	ui/tracksBg.js                    \
	ui/visualCanvas.js                \
	ui/_init.js                       \
	                                  \
	ui/bpm.js                         \
	ui/cursor.js                      \
	ui/getGridSec.js                  \
	ui/getTrackFromPageY.js           \
	ui/file.js                        \
	ui/newTrack.js                    \
	ui/panelSection.js                \
	ui/resize.js                      \
	ui/sample.js                      \
	ui/selectTool.js                  \
	ui/setFilesWidth.js               \
	ui/setGridScrollTop.js            \
	ui/setGridZoom.js                 \
	ui/setTrackLinesLeft.js           \
	ui/setTrackNamesWidth.js          \
	ui/toggleTracks.js                \
	ui/updateGridShadows.js           \
	                                  \
	ui/Track/constructor.js           \
	ui/Track/editName.js              \
	ui/Track/toggle.js                \
	                                  \
	wa/_init.js                       \
	wa/oscilloscope.js                \
	                                  \
	gs/bpm.js                         \
	gs/currentTime.js                 \
	gs/load.js                        \
	gs/save.js                        \
	gs/reset.js                       \
	                                  \
	gs/files/fileCreate.js            \
	gs/files/fileDelete.js            \
	gs/files/filePlayStop.js          \
	gs/files/File/constructor.js      \
	gs/files/File/delete.js           \
	gs/files/File/dragstart.js        \
	gs/files/File/joinFile.js         \
	gs/files/File/load.js             \
	                                  \
	gs/samples/selected/do.js         \
	gs/samples/selected/min.js        \
	gs/samples/selected/max.js        \
	                                  \
	gs/samples/samplesCopyPaste.js    \
	gs/samples/samplesCut.js          \
	gs/samples/samplesDelete.js       \
	gs/samples/samplesDuration.js     \
	gs/samples/samplesWhen.js         \
	gs/samples/samplesSlip.js         \
	gs/samples/samplesCrop.js         \
	gs/samples/samplesUnselect.js     \
	                                  \
	gs/samples/Sample/create.js       \
	gs/samples/Sample/cut.js          \
	gs/samples/Sample/delete.js       \
	gs/samples/Sample/duration.js     \
	gs/samples/Sample/inTrack.js      \
	gs/samples/Sample/mute.js         \
	gs/samples/Sample/select.js       \
	gs/samples/Sample/slip.js         \
	gs/samples/Sample/when.js         \
	                                  \
	gs/events/bpm.js                  \
	gs/events/clockUnits.js           \
	gs/events/divExtend.js            \
	gs/events/dropFiles.js            \
	gs/events/fileFilters.js          \
	gs/events/gridMouse.js            \
	gs/events/keyboard.js             \
	gs/events/panelMenu.js            \
	gs/events/resize.js               \
	gs/events/tools.js                \
	gs/events/toolCut.js              \
	gs/events/toolDelete.js           \
	gs/events/toolHand.js             \
	gs/events/toolMute.js             \
	gs/events/toolPaint.js            \
	gs/events/toolSelect.js           \
	gs/events/toolSlip.js             \
	gs/events/toolZoom.js             \
	                                  \
	init.js