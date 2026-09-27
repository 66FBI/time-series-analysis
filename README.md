# Time Series Analysis

A collection of **MATLAB** exercises covering signal processing, stochastic processes, time-series modeling, forecasting and frequency-domain analysis.

The repository progresses from basic signal generation and temporal data handling through filtering and correlation analysis to autoregressive and moving-average models, ARIMA forecasting, Fourier analysis and spectral filtering.

## Scripts

### 1. [Signal Generation](scripts/01_signal_generation.m)

Introduction to discrete signal construction and basic signal properties.

The script includes:

- rectangular signal generation,
- triangular signal generation,
- configurable sampling frequency and amplitude,
- signal visualization,
- mean-value calculation,
- signal energy calculation.

### 2. [Stochastic Signals](scripts/02_stochastic_signals.m)

Generation and analysis of deterministic and stochastic signals.

Topics include:

- harmonic signals with time-varying amplitude,
- sinc functions,
- Gaussian curves,
- uniform and normal random distributions,
- descriptive statistics,
- random walks,
- visualization of temporal passenger data.

### 3. [Resampling and Cross-Correlation](scripts/03_resampling_and_cross_correlation.m)

Processing of temporal datasets and introduction to convolution and correlation.

The script explores:

- MATLAB timetables,
- temporal aggregation,
- daily and monthly resampling,
- nearest-neighbor, linear and spline interpolation,
- convolution,
- cross-correlation,
- smoothing signals using convolution.

### 4. [Signal Filtering](scripts/04_signal_filtering.m)

Comparison of filtering techniques and correlation-based signal detection.

The analysis includes:

- moving-average filtering,
- Wiener filtering,
- Savitzky–Golay filtering,
- median filtering,
- noise reduction,
- cross-correlation with reference signals,
- detection of rectangular, triangular and Gaussian signal components.

### 6. [AR Processes and Stationarity](scripts/06_ar_process_stationarity.m)

Analysis and simulation of **autoregressive (AR) processes**.

Topics include:

- autocorrelation,
- partial autocorrelation,
- Yule–Walker estimation,
- AR(1), AR(2) and AR(3) processes,
- theoretical and simulated process properties,
- stationarity testing,
- Augmented Dickey–Fuller test,
- KPSS test.

### 7. [Moving Average Processes](scripts/07_moving_average_processes.m)

Simulation and analysis of **moving-average (MA) processes**.

The script includes:

- MA(1), MA(2) and MA(3) models,
- random-noise generation,
- theoretical and simulated means and variances,
- autocorrelation analysis,
- comparison of AR and MA process behavior.

### 8. [ARIMA Forecasting](scripts/08_arima_forecasting.m)

Time-series forecasting using **ARIMA models**.

The exercises include:

- generation of synthetic time series containing harmonic, trend and noise components,
- ARIMA model specification and estimation,
- out-of-sample forecasting,
- comparison of forecasts with known synthetic values,
- forecasting real passenger-count data,
- evaluation against subsequently observed values.

### 9. [AR–MA Approximation](scripts/09_ar_ma_approximation.m)

Numerical exploration of relationships between autoregressive and moving-average representations.

The script investigates:

- approximation of AR processes using finite MA representations,
- approximation of MA processes using AR representations,
- recursive coefficient generation,
- simulation using Gaussian noise,
- comparison of means and variances between original and approximated processes.

### 10. [Fourier Analysis](scripts/10_fourier_analysis.m)

Approximation of signals using **Fourier series**.

The script implements Fourier representations for different signal symmetries and compares reconstructed series with the original functions.

Topics include:

- even and odd signal components,
- Fourier coefficients,
- harmonic summation,
- signal reconstruction,
- visualization of Fourier approximations.

### 11. [Frequency-Domain Filtering](scripts/11_frequency_domain_filtering.m)

Introduction to Fourier transforms and frequency-domain signal processing.

The script covers:

- Fourier-series reconstruction,
- Fast Fourier Transform (FFT),
- amplitude and phase spectra,
- frequency-axis construction,
- identification of signal components in the frequency domain,
- frequency-domain filtering,
- inverse FFT signal reconstruction.

### 12. [Spectral Analysis](scripts/12_spectral_analysis.m)

Application of spectral analysis and frequency-domain filtering to real temporal datasets.

Two examples are analyzed:

- passenger-count data, including identification and removal of an annual component,
- temperature data, including identification and removal of a daily component.

The workflow uses FFT-based amplitude spectra, frequency-domain filters and inverse transforms to examine periodic structure in time series.

## Topics

The exercises collectively cover:

- signal generation
- stochastic processes
- temporal resampling and interpolation
- convolution and cross-correlation
- signal filtering
- autocorrelation and partial autocorrelation
- AR and MA processes
- stationarity testing
- ARIMA forecasting
- Fourier series
- Fast Fourier Transform
- spectral analysis
- frequency-domain filtering

## Technologies

- **MATLAB**
- Signal Processing Toolbox
- Statistics and Machine Learning Toolbox
- Econometrics Toolbox
- numerical signal processing
- statistical time-series analysis

## Repository Structure

```text
time-series-analysis/
├── data/
│   ├── 2024_Gin_kor_1b.txt
│   ├── 2024_Gin_kor_1c.txt
│   ├── 2024_Gin_szum_1a.txt
│   ├── 2024_Gin_szum_1b.txt
│   ├── corr_01.txt
│   ├── corr_02.txt
│   ├── dem_201.txt
│   ├── kor_301.txt
│   ├── kroki.txt
│   ├── kursy.csv
│   ├── pasazer.txt
│   ├── szum_102.txt
│   └── temp_pow.txt
├── scripts/
│   ├── 01_signal_generation.m
│   ├── 02_stochastic_signals.m
│   ├── 03_resampling_and_cross_correlation.m
│   ├── 04_signal_filtering.m
│   ├── 06_ar_process_stationarity.m
│   ├── 07_moving_average_processes.m
│   ├── 08_arima_forecasting.m
│   ├── 09_ar_ma_approximation.m
│   ├── 10_fourier_analysis.m
│   ├── 11_frequency_domain_filtering.m
│   └── 12_spectral_analysis.m
└── README.md
```

## Author

**Michał Kuśnierz**

Developed as part of the **Time Series Analysis** course at **AGH University of Science and Technology**, 2026.
